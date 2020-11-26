#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Default state of lock keys
SetNumlockState, AlwaysOn
SetCapsLockState, AlwaysOff
SetScrollLockState, AlwaysOff
return

; ; Google Search highlighted text with ALT + S
; !s::
; {
;  Send, ^c
;  Sleep 50
;  Run, http://www.google.com/search?q=%clipboard%
;  Return
; }


;New Folder
{
    ^+y::
    Return
}


; Launch Thunderbird
{
!q::Run, E:\Programme\Mozilla Thunderbird\thunderbird.exe ; use alt + Q
return
}


; Launch Youtube
{
!y::Run "www.youtube.com" ; use alt + Y
return
}

;Launch KeePass
{
    !w::Run, E:\Programme\KeePass Password Safe 2\KeePass.exe
}


;Launch Windows Terminal
{
    #Enter::
    terminal := WinExist("ahk_exe WindowsTerminal.exe")
    if (terminal) 
    {
        active := WinActive("ahk_id " terminal)
        if (active)
            WinMinimize, ahk_id %active%
        else
            WinActivate, ahk_id %terminal%
    }
    else
       Run wt.exe
Return
}

; Suspend AutoHotKey
ScrollLock::Suspend ; Win + scrollLock
return

; Switch virtual desktops
LWin & 1::sendevent {LWin down}{LCtrl down}{Left}{LCtrl up}{LWin up}  ; switch to previous virtual desktop

LWin & 2::sendevent {LWin down}{LCtrl down}{Right}{LCtrl up}{LWin up}

{
    ;Get device ID from DetermineMicId.ahk
    #F1::
    SoundSet, +1, MASTER, mute,10 ;10 was my mic id number use the code below the dotted line to find your mic id. you need to replace all 10's  <---------IMPORTANT
    SoundGet, master_mute, , mute,10

    ToolTip, Mute %master_mute% ;use a tool tip at mouse pointer to show what state mic is after toggle
    SetTimer, RemoveToolTip, 1000
    return

    RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return
}