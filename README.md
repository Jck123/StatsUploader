# StatsUploaderPlugin Documentation
Welcome to the StatsUploaderPlugin! Designed and Produced by Jck for the sole purpose of speeding up and securing the stats of a Rocket League match for the Varsity Esports League(VESL) of Stiegler EdTech. The current version is **Version 1.0.1**. If you find a new bug not in the [Known Bugs](#known-bugs, "Goto known-bugs") list down below, please report it to Jck at jameskelly0531@gmail.com. 
## Dependencies
* Rocket League
* [Bakkesmod](https://github.com/bakkesmodorg/BakkesModInjectorCpp/releases/latest/download/BakkesModSetup.zip, "Bakkesmod download link")
* [Google Service Account](https://support.google.com/a/answer/7378726?hl=en, "Google Service Account tutorial")
## Pre-installation
This documentation is written under the assumption the end user has already set up a Google Service Account and understands how to manage it, as this is a requirement to access a Google Spreadsheet that is not publicly available to edit. If you do not know how to set up a Google Service Account, click on the link above to be redirected to documentation provided by Google to set up a Google Service Account.
This documentation also is written under the assumption the end user has set up Bakkesmod on their PC. If that is not the case, please click on the link above to download the Bakkesmod installer.
## Installation
1. Download the required DLL files
    * **StatsUploaderPlugin.dll**
    * **cpprest_2_10.dll**
    * **libcrypto-3-x64.dll**
2. Place the **StatsUploaderPlugin.dll** file inside your Bakkesmod appdata plugins folder. The default location for this is: ``%appdata%\bakkesmod\bakkesmod\plugins``
3. Place the **cpprest_2_10.dll** and **libcrypto-3-x64.dll** files inside your Bakkesmod appdata libs folder. The default location for this is: ``%appdata%\bakkesmod\bakkesmod\libs``
Now the StatsUploaderPlugin should be fully installed and operational! Just don’t forget to enable it in the plugin manager or using the “plugin load” command on the Bakkesmod console.
## Operation Instructions
Now that you have installed the StatsUploaderPlugin, you will need to add your Google Spreadsheet details and Google Service Account credentials.

### Console Cvars:
* **StatsUp_CredFilePath**: Path of the Google Service Account's credentials as a json file that is provided upon creation. Make sure it is an absolute path(Starts from the letter drive i.e. “C:\”).
* **StatsUp_GoogleSpreadSheetID**: ID of the Google Spreadsheet you wish to save to. This is contained in the URL of the spreadsheet with the following format: ``https://docs.google.com/spreadsheets/d/{Spreadsheet ID}/``
* **StatsUp_GoogleSheetID**: ID of the Google Sheet you wish to save to.
* **StatsUp_TrackBots**: Set this value to false if you wish to ignore bots when stats are being compiled.
* **StatsUp_Enable**: Set this value to false if you wish to disable the plugin without losing the values entered in the other Cvars.
* **StatsUp_SaveToFile**: Set this value to true if you wish to save to files instead of uploading to a Google Spreadsheet.
All of these Cvars are also modifiable under the Bakkesmod Plugins tab. Look for “StatsUploaderPlugin” on the list on the left.
## Known Bugs
No known bugs at this time
Please report any bugs you find in the issues section or email me at jameskelly0531@gmail.com
## 1.0.1 Patch notes
Additions:
* Added ability to disable plugin without fully disabling it, allowing text fields to remain saved
* Added ability to entirely skip saving process and save directly to file
Bug fixes:
* Fixed fatal crash bug where pasting text to the plugins settings page caused game to crash
* Fixed bug where only Epic account users were not being tracked when bot tracking was disabled
* Fixed bug where only Steam IDs of players were saved to stats, leading to Epic account users having their UIDs considered “0”
* Fixed bug where “Upload Datetime” would post as a strange array of numbers
