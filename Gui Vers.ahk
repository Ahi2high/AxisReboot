#SingleInstance, force
Gui, Add, Picture, x5 y5 w50 h50, https://placementdrive.in/wp-content/uploads/2022/11/1200px-Genpact_logo.svg-1024x379.png
Gui, Add, Text, x60 y10 w300 h30, Lifespan Call Log
Gui, Add, Text, x10 y60 w50 h30, Name:
Gui, Add, Edit, x60 y60 w200 h30 vName required
Gui, Add, Text, x10 y100 w50 h30, Company:
Gui, Add, Edit, x60 y100 w200 h30 vCompany required
Gui, Add, Text, x10 y140 w50 h30, Site:
Gui, Add, Edit, x60 y140 w200 h30 vSite required
Gui, Add, Text, x10 y180 w50 h30, Tower:
Gui, Add, Edit, x60 y180 w200 h30 vTower required
Gui, Add, Text, x10 y220 w100 h30, Resolution:
Gui, Add, DropDownList, x110 y220 w150 h30 vResolution required, ALC Support|Blade Support|BOP|External Toolbox Request|Internal Toolbox Request|Start/Stop|Status Check|Wind Speed|Yaw|Repair/Maintenance
Gui, Add, CheckBox, x10 y260 w200 h30 vLoadShutdownCheckbox, Load Shutdown
Gui, Add, Button, x60 y300 w100 h30 gSubmitButton, Submit
Gui, Add, Button, x170 y300 w100 h30 gGenerateButton, Generate
Gui, Add, Text, x10 y340 w100 h30, Do Not Reset Codes:
Gui, Add, Edit, x110 y340 w150 h30 vCode

Gui, Add, ListView, x300 y60 w400 h310 gListView, Name|Company|Site|Tower|Resolution|Load Shutdown|Return to Service Time
LV_ModifyCol(6, "AutoHdr")
LV_ModifyCol(7, "AutoHdr")
Gui, Add, Button, x450 y375 w200 h30 gDownloadButton, Download as CSV

Gui, Show, w700 h400, Wind Turbine Call Log

SubmitButton:
    Gui, Submit, NoHide
    LV_Add("", Name, Company, Site, Tower, Resolution, (LoadShutdownCheckbox = "1" ? "Yes" : "No"), "")
    if (LoadShutdownCheckbox = "1") {
        InputBox, ReturnToServiceTime, Enter Return to Service Time:, , , 200, , , , 
        LV_Modify(LV_GetCount(), 7, ReturnToServiceTime)
    }
    GuiControl,, Name
    GuiControl,, Company
    GuiControl,, Site
    GuiControl,, Tower
    GuiControl,, Resolution
    GuiControl,, LoadShutdownCheckbox
Return

DownloadButton:
    LV_GetText(AllItems)
    FileDelete, %A_ScriptDir%\call_log.csv
    FileAppend, Name, Company, Site, Tower, Resolution, Load Shutdown, Return to Service Time`n%AllItems%, %A_ScriptDir%\call_log.csv
Return

GenerateButton:
    Gui, Submit, NoHide
    MsgBox, 0, Generated Information, 
    (
        Name: %Name%
        Company: %Company%
        Site: %Site%
        Tower: %Tower%
        Resolution: %Resolution%
        Load Shutdown: % (LoadShutdownCheckbox = "1" ? "Yes" : "No")
    )
Return

GuiClose:
    ExitApp
