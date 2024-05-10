#SingleInstance, force
Gui, Add, Text, x10 y10 w150 h20, Name:
Gui, Add, Edit, x170 y10 w200 h20 vName required
Gui, Add, Text, x10 y40 w150 h20, Company:
Gui, Add, Edit, x170 y40 w200 h20 vCompany required
Gui, Add, Text, x10 y70 w150 h20, Site:
Gui, Add, Edit, x170 y70 w200 h20 vSite required
Gui, Add, Text, x10 y100 w150 h20, Tower:
Gui, Add, Edit, x170 y100 w200 h20 vTower required
Gui, Add, Text, x10 y130 w150 h20, Resolution:
Gui, Add, DropDownList, x170 y130 w200 h120 vResolution required, ALC Support|Blade Support|BOP|External Toolbox Request|Internal Toolbox Request|Start/Stop|Status Check|Wind Speed|Yaw|Repair/Maintenance
Gui, Add, CheckBox, x170 y260 w200 h20 vLoadShutdownCheckbox, Load Shutdown
Gui, Add, Button, x10 y300 w150 h30 gSubmitButton, Submit
Gui, Add, Button, x170 y300 w70 h30 gGenerateButton, Generate
Gui, Show, w400 h350, Wind Turbine Call Log

SubmitButton:
    Gui, Submit, NoHide
    LV_Add("", Name, Company, Site, Tower, Resolution, (LoadShutdownCheckbox ? "Yes" : "No"), "")
    if (LoadShutdownCheckbox)
        InputBox, ReturnToServiceTime, Enter Return to Service Time:, , , 200, , , , 
    GuiControl,, Name
    GuiControl,, Company
    GuiControl,, Site
    GuiControl,, Tower
Return

GenerateButton:
    Gui, Submit, NoHide
    MsgBox, 4, Generated Information, 
    (
        Name: %Name%
        Company: %Company%
        Site: %Site%
        Tower: %Tower%
        Resolution: %Resolution%
        Load Shutdown: % (LoadShutdownCheckbox ? "Yes" : "No")
    )
    IfMsgBox, Yes
        MsgBox, The information has been copied.
Return

GuiClose:
    ExitApp
