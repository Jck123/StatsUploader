#include "pch.h"
#include "StatsUploaderPlugin.h"
#include <fstream>
#include <cpprest/http_client.h>
#include <jwt-cpp/jwt.h>
#include <string>
#include <Windows.h>

using namespace utility;
using namespace web;
using namespace web::http;
using namespace web::http::client;

BAKKESMOD_PLUGIN(StatsUploaderPlugin , "StatsUploaderPlugin", plugin_version, PLUGINTYPE_FREEPLAY)

std::shared_ptr<CVarManagerWrapper> _globalCvarManager;

struct StatsUploaderPlugin::GoogleCreds
{
	std::string credFilePath;
	std::string priv_key;
	std::string priv_key_id;
	std::string client_email;
	int return_code;
};

void StatsUploaderPlugin::onLoad()
{
	_globalCvarManager = cvarManager;

	cvarManager->registerCvar("StatsUp_CredFilePath", "", "Path of the Google Service Account's credentials as a json file that is provided upon creation. Make sure it is a an absolute path");
	cvarManager->registerCvar("StatsUp_GoogleSpreadSheetID", "", "ID of the Google Spreadsheet you wish to save to");
	cvarManager->registerCvar("StatsUp_GoogleSheetID", "", "ID of the Google Sheet you wish to save to");
	cvarManager->registerCvar("StatsUp_TrackBots", "0", "Set to false if you wish to ignore bots during stats collection", true, true, 0, true, 1);
	cvarManager->registerCvar("StatsUp_Enable", "1", "Set to false if you wish to disable the plugin without fully disabling it from the plugin manager.", true, true, 0, true, 1);
	cvarManager->registerCvar("StatsUp_SaveToFile", "0", "Set to true if you wish to save all stats to files instead of sending via Google Sheets.", true, true, 0, true, 1);


	gameWrapper->HookEvent("Function TAGame.GameEvent_Soccar_TA.EventMatchEnded", [this](std::string eventName) {
		if (!cvarManager->getCvar("StatsUp_Enable").getBoolValue()) return;

		ServerWrapper server = gameWrapper->IsInOnlineGame() ? gameWrapper->GetOnlineGame() : gameWrapper->GetGameEventAsServer();

		if (server.IsNull())
		{
			LOG("ERROR: Could not obtain ServerWrapper. Please contact the plugin developer");
			return;
		}

		ArrayWrapper<PriWrapper> PRIs = server.GetPRIs();
		if (PRIs.IsNull())
		{
			LOG("ERROR: Could not obtain ArrayWrapper. Please contact the plugin developer");
			return;
		}

		json::value statsArr = json::value::array();

		std::map<OnlinePlatform, utility::string_t> PLATFORM_NAME;
		PLATFORM_NAME[OnlinePlatform_Unknown] = L"Unknown";
		PLATFORM_NAME[OnlinePlatform_Steam] = L"Steam";
		PLATFORM_NAME[OnlinePlatform_PS4] = L"PS4";
		PLATFORM_NAME[OnlinePlatform_PS3] = L"PS3";
		PLATFORM_NAME[OnlinePlatform_Dingo] = L"Dingo"; //XBox?
		PLATFORM_NAME[OnlinePlatform_QQ] = L"QQ";
		PLATFORM_NAME[OnlinePlatform_OldNNX] = L"OldNNX";
		PLATFORM_NAME[OnlinePlatform_NNX] = L"NNX";
		PLATFORM_NAME[OnlinePlatform_PsyNet] = L"PsyNet";
		PLATFORM_NAME[OnlinePlatform_Deleted] = L"Deleted";
		PLATFORM_NAME[OnlinePlatform_WeGame] = L"WeGame";
		PLATFORM_NAME[OnlinePlatform_Epic] = L"Epic";
		PLATFORM_NAME[OnlinePlatform_MAX] = L"MAX";

		LOG("==INITIATING STATS COMPILATION==");

		for (PriWrapper p : PRIs)
		{
			if ((p.GetUniqueIdWrapper().GetIdString().compare("Unknown|0|0") == 0) && !(cvarManager->getCvar("StatsUp_TrackBots").getBoolValue()))
				continue;
			
			json::value playerArr = json::value::array();
			playerArr[0] = json::value::string(L"=ADD(IF(INDIRECT(ADDRESS(ROW()-1,COLUMN())) = \"RowID\", -1, INDIRECT(ADDRESS(ROW()-1, COLUMN()))), 1)");
			UniqueIDWrapper UIDWrap = p.GetUniqueIdWrapper();
			std::string UserUID = UIDWrap.GetIdString().starts_with("Steam") ? std::to_string(UIDWrap.GetUID()) : UIDWrap.GetEpicAccountID();
			playerArr[1] = json::value::string(conversions::to_string_t((std::string("=T(\"") + UserUID + std::string("\")"))));
			playerArr[2] = json::value::string(p.GetPlayerName().ToWideString());
			playerArr[3] = json::value::string(PLATFORM_NAME[p.GetPlatform()]);
			playerArr[4] = json::value::string(conversions::to_string_t(server.GetMatchGUID()));
			playerArr[5] = json::value::string(conversions::to_string_t(gameWrapper->GetCurrentMap()));
			playerArr[6] = json::value::string(p.GetTeam().GetTeamName().ToWideString());
			playerArr[7] = json::value::string(std::to_wstring(p.GetTeam().GetTeamNum() + 0));
			UnrealColor teamColor = p.GetTeam().GetTeamColor();
			playerArr[8] = json::value::string(conversions::to_string_t(std::to_string(teamColor.R - 0) + std::string(",") + std::to_string(teamColor.G - 0) + std::string(",") + std::to_string(teamColor.B - 0)));
			playerArr[9] = json::value::string(std::to_wstring(p.GetMatchScore()));
			playerArr[10] = json::value::string(std::to_wstring(p.GetMatchGoals()));
			playerArr[11] = json::value::string(std::to_wstring(p.GetMatchShots()));
			playerArr[12] = json::value::string(std::to_wstring(p.GetMatchSaves()));
			playerArr[13] = json::value::string(std::to_wstring(p.GetMatchAssists()));
			playerArr[14] = json::value::string(std::to_wstring(p.GetKills()));
			playerArr[15] = json::value::string(std::to_wstring(p.GetDeaths()));

			auto time = std::chrono::floor<std::chrono::seconds>(std::chrono::system_clock::now());
			auto today = std::chrono::floor<std::chrono::days>(time);
			std::string datetime = std::format("{0:%Y-%Om-%Od} {1:%OH:%OM:%OS} UTC",
				std::chrono::year_month_day{ today },
				std::chrono::hh_mm_ss{ time - today });
			playerArr[16] = json::value::string(conversions::to_string_t(datetime));

			statsArr[statsArr.size()] = playerArr;
		}

		LOG("--STATS COMPILATION COMPLETE--");

		if (cvarManager->getCvar("StatsUp_SaveToFile").getBoolValue())
		{
			LOG("--SAVING TO FILE--");
			if (SaveToFile(statsArr) == 1)
				LOG("ERROR: Failed to save to file. Please contact plugin developer");
			else
				LOG("==SAVE COMPLETE==");
			return;
		}

		std::string credFilePath = cvarManager->getCvar("StatsUp_CredFilePath").getStringValue();
		if (credFilePath.empty())
		{
			LOG("ERROR: The credential file path field has not been filled. Please fill the field in the window or update the StatsUp_CredFilePath cvar");
			LOG("--SAVING STATS TO FILE AS BACKUP--");
			if (SaveToFile(statsArr) == 1)
				LOG("ERROR: Failed to save to file. Please contact plugin developer");
			else
				LOG("==SAVE COMPLETE==");
			return;
		}
		GoogleCreds googCreds = ParseCreds(credFilePath);
		if (googCreds.return_code > 0)
		{
			std::string errorMessage;
			switch (googCreds.return_code)
			{
			case 1:
				errorMessage = "ERROR: The 'StatsUp_CredFilePath' file path is invalid, please correct it";
				break;
			case 2:
				errorMessage = "ERROR: The json object could not be parsed at " + googCreds.credFilePath + ", please validate the file";
				break;
			case 3:
				errorMessage = "ERROR: 'private_key' could not be processed at " + googCreds.credFilePath + ", please validate the file";
				break;
			case 4:
				errorMessage = "ERROR: 'priv_key_id' could not be processed at " + googCreds.credFilePath + ", please validate the file";
				break;
			case 5:
				errorMessage = "ERROR: 'client_email' could not be processed at " + googCreds.credFilePath + ", please validate the file";
				break;
			}
			LOG(errorMessage);
			LOG("--SAVING STATS TO FILE AS BACKUP--");
			if (SaveToFile(statsArr) == 1)
				LOG("ERROR: Failed to save to file. Please contact plugin developer");
			else
				LOG("==SAVE COMPLETE==");
			return;
		}

		std::string googSpreadSheetID = cvarManager->getCvar("StatsUp_GoogleSpreadSheetID").getStringValue();
		if (googSpreadSheetID.empty())
		{
			LOG("ERROR: The Google Spreadsheet ID field has not been filled. Please fill the field in the window or update the StatsUp_GoogleSpreadSheetID cvar");
			LOG("--SAVING STATS TO FILE AS BACKUP--");
			if (SaveToFile(statsArr) == 1)
				LOG("ERROR: Failed to save to file. Please contact plugin developer");
			else
				LOG("==SAVE COMPLETE==");
			return;
		}

		std::string googSheetID = cvarManager->getCvar("StatsUp_GoogleSheetID").getStringValue();
		if (googSheetID.empty())
		{
			LOG("ERROR: The Google Sheet ID field has not been filled. Please fill the field in the window or update the StatsUp_GoogleSheetID cvar");
			LOG("--SAVING STATS TO FILE AS BACKUP--");
			if (SaveToFile(statsArr) == 1)
				LOG("ERROR: Failed to save to file. Please contact plugin developer");
			else
				LOG("==SAVE COMPLETE==");
			return;
		}

		LOG("--CONTACTING GOOGLE AUTH SERVER TO OBTAIN ACCESS TOKEN--");

		std::string access_token = GetGoogleAuthToken(googCreds);

		if (access_token.starts_with("ERROR")) {
			LOG(access_token);
			LOG("--SAVING STATS TO FILE AS BACKUP--");
			if (SaveToFile(statsArr) == 1)
				LOG("ERROR: Failed to save to file. Please contact plugin developer");
			else
				LOG("==SAVE COMPLETE==");
			return;
		}

		LOG("--SUCCESSFULLY OBTAINED AUTH TOKEN--");
		LOG("--UPLOADING STATS TO GOOGLE SHEETS--");

		int rc = SendStats(googSpreadSheetID, googSheetID, access_token, statsArr);

		if (rc > 0) {
			std::string output;
			switch (rc)
			{
			case 1:
				output = "ERROR: Could not find Google Spreadsheet. Please verify Google Spreadsheet ID";
				break;
			case 2:
				output = "ERROR: Bad Request. Please verify Google Sheet ID";
				break;
			case 3:
				output = "ERROR: Unauthorized access. Please verify integrity of your credentials file and that you have added the service account to the list of permitted editors";
				break;
			case 4:
				output = "ERROR: Request timeout. Please verify your internet connection is stable";
				break;
			case 5:
				output = "ERROR: Unknown error encountered. Please contact plugin developer";
				break;
			}
			LOG(output);
			LOG("--SAVING STATS TO FILE AS BACKUP--");
			if (SaveToFile(statsArr) == 1)
				LOG("ERROR: Failed to save to file. Please contact plugin developer");
			else
				LOG("==SAVE COMPLETE==");
			return;
		}

		LOG("==SUCCESSFULLY UPLOADED STATS TO GOOGLE SHEETS==");
		});
}

StatsUploaderPlugin::GoogleCreds StatsUploaderPlugin::ParseCreds(std::string serviceAccountPath)
{
	GoogleCreds outputCreds;

	//Opening file
	std::ifstream credsFile;
	credsFile.open(serviceAccountPath);
	if (!credsFile)
	{
		outputCreds.return_code = 1;
		return outputCreds;
	}
	outputCreds.credFilePath = serviceAccountPath;

	//Parsing json file
	json::value credsJson;
	try
	{
		credsJson = json::value::object();
		credsJson = json::value::parse(credsFile);
		if (credsJson.is_null())
		{
			outputCreds.return_code = 2;
			return outputCreds;
		}
	}
	catch (std::exception e)
	{
		outputCreds.return_code = 2;
		return outputCreds;
	}


	//Obtaining private_key
	std::string private_key = conversions::to_utf8string(credsJson[L"private_key"].serialize());
	if (private_key.compare("null") == 0)
	{
		outputCreds.return_code = 3;
		return outputCreds;
	}
	private_key = private_key.substr(1, private_key.size() - 2);
	std::string::size_type index = 0;
	while ((index = private_key.find("\\n", index)) != std::string::npos)
		private_key.replace(index++, 2, "\n");
	outputCreds.priv_key = private_key;

	//Obtaining private_key_id
	std::string priv_key_id = conversions::to_utf8string(credsJson[L"private_key_id"].serialize());
	if (priv_key_id.compare("null") == 0)
	{
		outputCreds.return_code = 4;
		return outputCreds;
	}
	priv_key_id = priv_key_id.substr(1, priv_key_id.size() - 2);
	outputCreds.priv_key_id = priv_key_id;

	//Obtaining client_email
	std::string client_email = conversions::to_utf8string(credsJson[L"client_email"].serialize());
	if (client_email.compare("null") == 0)
	{
		outputCreds.return_code = 5;
		return outputCreds;
	}
	client_email = client_email.substr(1, client_email.size() - 2);
	outputCreds.client_email = client_email;

	outputCreds.return_code = 0;
	return outputCreds;
}

int StatsUploaderPlugin::SaveToFile(json::value arrToSave)
{
	std::filesystem::path dirPath = getenv("APPDATA") + std::string("\\bakkesmod\\bakkesmod\\GoogleUploaderPlugin");
	if (!std::filesystem::is_directory(dirPath) || !std::filesystem::exists(dirPath))
		std::filesystem::create_directory(dirPath);
	std::string fileName = "\\Match-" + (gameWrapper->IsInOnlineGame() ? gameWrapper->GetOnlineGame().GetMatchGUID() : gameWrapper->GetGameEventAsServer().GetMatchGUID()) + ".csv";
	std::ofstream outputFile;
	outputFile.open(dirPath.string() + fileName);
	if (!outputFile.good())
	{
		outputFile.open("C:\\GoogleUploaderPlugin" + fileName);
		if (!outputFile.good())
			return 1;
	}

	outputFile << "sep=;" << std::endl << "RowID;UID;Player Name;Platform;Match ID;Map;Team Name;Team Number;Team Color;Score;Goals;Shots;Saves;Assists;Kills;Deaths;Upload Datetime" << std::endl;
	for (json::value rowArr : arrToSave.as_array())
	{
		std::string rowAsString;
		for (json::value rowVal : rowArr.as_array())
		{
			rowAsString += conversions::to_utf8string(rowVal.as_string());
			rowAsString += ";";
		}
		outputFile << rowAsString << std::endl;
	}
	outputFile.close();
	LOG("Saved stats to " + dirPath.string() + fileName);

	return 0;
}

std::string StatsUploaderPlugin::GetGoogleAuthToken(GoogleCreds creds)
{
	//Generating JWT and signing
	jwt::traits::kazuho_picojson::string_type token;
	try
	{
		token = jwt::create()
			.set_algorithm("RS256")
			.set_type("JWT")
			.set_key_id(creds.priv_key_id)
			.set_issuer(creds.client_email)
			.set_payload_claim("scope", jwt::claim(std::string{ "https://www.googleapis.com/auth/spreadsheets" }))
			.set_audience("https://oauth2.googleapis.com/token")
			.set_issued_at(std::chrono::system_clock::now())
			.set_expires_at(std::chrono::system_clock::now() + std::chrono::seconds{ 60 })
			.sign(jwt::algorithm::rs256("", creds.priv_key, "", ""));
	}
	catch (std::exception e)
	{
		return "ERROR: Problem generating JWT. Please verify integrity of " + creds.credFilePath;
	}

	//Setting up payload to send to Authentication server
	json::value payloadJson = json::value::object();
	payloadJson[L"grant_type"] = json::value::string(L"urn:ietf:params:oauth:grant-type:jwt-bearer");
	payloadJson[L"assertion"] = json::value::string(conversions::to_string_t(token.c_str()));

	//Creating client and sending request
	http_client client(U("https://oauth2.googleapis.com"));
	http_response response = client.request(methods::POST, U("/token"), payloadJson).get().content_ready().get();

	std::string output;

	//Response handling
	if (response.status_code() == status_codes::OK)
	{
		output = conversions::to_utf8string(response.extract_json().get().at(L"access_token").serialize());
		output = output.substr(1, output.size() - 2);
	}
	else if (response.status_code() == status_codes::BadRequest)
		output = "ERROR: Bad Request. Validate your service account's json file";
	else if (response.status_code() == status_codes::RequestTimeout)
		output = "ERROR: Request Timeout. Please ensure your connection is stable";
	else
		output = "ERROR: Something went wrong. Please contact the plugin developer";

	return output;
}

int StatsUploaderPlugin::SendStats(std::string googleSpreadSheetID, std::string googleSheetName, std::string access_token, json::value statsArr)
{
	http_client client(U("https://sheets.googleapis.com/"));
	uri_builder builder(U("v4/spreadsheets/"));
	builder.append_path(conversions::to_string_t(googleSpreadSheetID));
	builder.append_path(U("/values"));
	builder.append_path(conversions::to_string_t(googleSheetName + "!A2:Q:append"));
	builder.append_query(U("access_token"), conversions::to_string_t(access_token));
	builder.append_query(U("valueInputOption"), U("USER_ENTERED"));
	builder.append_query(U("insertDataOption"), U("INSERT_ROWS"));
	builder.append_query(U("includeValuesInResponse"), U("false"));

	json::value sheetsPayload = json::value::object();
	sheetsPayload[L"range"] = json::value::string(conversions::to_string_t(googleSheetName + "!A2:Q"));
	sheetsPayload[L"majorDimension"] = json::value::string(L"ROWS");
	sheetsPayload[L"values"] = statsArr;

	http_response response = client.request(methods::POST, builder.to_string(), sheetsPayload).get().content_ready().get();

	if (response.status_code() == status_codes::OK)
		return 0;
	else if (response.status_code() == status_codes::NotFound)
		return 1;
	else if (response.status_code() == status_codes::BadRequest)
		return 2;
	else if (response.status_code() == status_codes::Unauthorized)
		return 3;
	else if (response.status_code() == status_codes::RequestTimeout)
		return 4;
	else
		return 5;
}