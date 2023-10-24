#include "pch.h"
#include "StatsUploaderPlugin.h"

void StatsUploaderPlugin::RenderSettings() {
	CVarWrapper enableCvar = cvarManager->getCvar("StatsUp_Enable");
	if (!enableCvar) return;
	bool enabled = enableCvar.getBoolValue();
	if (ImGui::Checkbox("Enable plugin", &enabled))
		enableCvar.setValue(enabled);
	if (ImGui::IsItemHovered())
		ImGui::SetTooltip("Enable to allow saving of stats");

	CVarWrapper fileCvar = cvarManager->getCvar("StatsUp_SaveToFile");
	if (!fileCvar) return;
	bool fileEnabled = fileCvar.getBoolValue();
	if (ImGui::Checkbox("Save to file", &fileEnabled))
		fileCvar.setValue(fileEnabled);
	if (ImGui::IsItemHovered())
		ImGui::SetTooltip("Enable to save to file instead of sending to Google Spreadsheet");

	CVarWrapper credFileCvar = cvarManager->getCvar("StatsUp_CredFilePath");
	if (!credFileCvar) return;
	std::string credFilePath = credFileCvar.getStringValue();
	if (ImGui::InputText("Credentials File Path", &credFilePath))
		credFileCvar.setValue(credFilePath);
	if (ImGui::IsItemHovered())
		ImGui::SetTooltip("Enter the path of the .json file that contains your Google Spreadsheet credentials.\nThis file is obtained upon the creation of the Google Service Account. Please enter the full path.");

	CVarWrapper spreadSheetIDCvar = cvarManager->getCvar("StatsUp_GoogleSpreadSheetID");
	if (!spreadSheetIDCvar) return;
	std::string spreadSheetID = spreadSheetIDCvar.getStringValue();
	if (ImGui::InputText("Spreadsheet ID", &spreadSheetID))
		spreadSheetIDCvar.setValue(spreadSheetID);
	if (ImGui::IsItemHovered())
		ImGui::SetTooltip("Enter the ID of the Google Spreadsheet you wish to save to.\nThis is contained in the URL of the spreadsheet with the following format: docs.google.com/spreadsheets/d/{Spreadsheet ID}/");

	CVarWrapper sheetIDCvar = cvarManager->getCvar("StatsUp_GoogleSheetID");
	if (!sheetIDCvar) return;
	std::string sheetID = sheetIDCvar.getStringValue();
	if (ImGui::InputText("Sheet ID", &sheetID))
		sheetIDCvar.setValue(sheetID);
	if (ImGui::IsItemHovered())
		ImGui::SetTooltip("Enter the name of the Google Sheet you wish the save to.");

	CVarWrapper botTrackCvar = cvarManager->getCvar("StatsUp_TrackBots");
	if (!botTrackCvar) return;
	bool botEnabled = botTrackCvar.getBoolValue();
	if (ImGui::Checkbox("Track bot controlled players", &botEnabled))
		botTrackCvar.setValue(botEnabled);
	if (ImGui::IsItemHovered())
		ImGui::SetTooltip("Enable to save the stats of bot controlled players");
}