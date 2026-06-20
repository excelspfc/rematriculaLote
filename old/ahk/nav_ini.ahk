#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

WinActivate, JACAD - Sistema Educacional %swa%
Sleep, 333

ControlSend, , {F10}{Right}{Down 10}{Right}{Down 7}{Enter}, JACAD - Sistema Educacional %swa%

WinWaitNotActive, JACAD - Sistema Educacional %swa%