#pragma once

#include "GuiBase.h"
#include "bakkesmod/plugin/bakkesmodplugin.h"
#include "bakkesmod/plugin/pluginwindow.h"
#include "bakkesmod/plugin/PluginSettingsWindow.h"
#include <cpprest/http_client.h>

#include "version.h"
constexpr auto plugin_version = stringify(VERSION_MAJOR) "." stringify(VERSION_MINOR) "." stringify(VERSION_PATCH) "." stringify(VERSION_BUILD);


class StatsUploaderPlugin: public BakkesMod::Plugin::BakkesModPlugin, public SettingsWindowBase
{
	struct GoogleCreds;

	//Boilerplate
	void onLoad() override;
	GoogleCreds ParseCreds(std::string serviceAccountPath);
	int SaveToFile(web::json::value statsArr);
	std::string GetGoogleAuthToken(GoogleCreds);
	int SendStats(std::string googleSpreadSheetID, std::string googleSheetName, std::string access_token, web::json::value statsArr);

public:
	void RenderSettings() override;
};
