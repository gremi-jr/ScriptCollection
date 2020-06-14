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


;Launch VSCode
{
    !c::Run, E:\Programme\Microsoft VS Code\code.exe
}


;Launch VSCode
{
    #Enter::Run, C:\Users\Timo Gremler\cmder\cmder.exe
}

; Suspend AutoHotKey
ScrollLock::Suspend ; Win + scrollLock
return

