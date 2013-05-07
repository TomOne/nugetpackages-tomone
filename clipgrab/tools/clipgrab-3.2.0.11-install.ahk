#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Run, clipgrab-3.2.0.11.exe
WinWait, Setup - ClipGrab,, 10
	WinActivate
IfWinNotExist, Setup - ClipGrab
	ExitApp
Send, {Enter}
Sleep, 200
Send, {Tab}{Up}{Enter}
Sleep, 200
Send, {Enter}
Sleep, 200
Send, {End}{Enter}
Sleep, 200
Send, {Enter}
WinWait, Setup - ClipGrab, Beenden des ClipGrab Setup-Assistenten, 60
	WinActivate
IfWinNotExist, Setup - ClipGrab, Beenden des ClipGrab Setup-Assistenten
	ExitApp
Sleep, 200
Send, {Space}{Enter}
WinWaitClose, Setup - ClipGrab, Beenden des ClipGrab Setup-Assistenten