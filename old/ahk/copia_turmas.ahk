#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

WinActivate, Rematrícula em Lote - Controle de Turmas
Sleep, 333

BlockInput, MouseMove	; Bloqueia o movimento do cursor do mouse
CoordMode, Mouse, Screen	; Considera a coordenada pela tela
Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
ControlClick, , Rematrícula em Lote - Controle de Turmas,, Left, 1,  x375 y300 NA	; Clica com o botão esquerdo na coordenada retornada
BlockInput, MouseMoveOff	; Desbloqueia o movimento do cursor do mouse
Sleep, 333

ControlSend, , {Control Down}{End}{Control Up}{Up}, Rematrícula em Lote - Controle de Turmas
Sleep, 333

While !Clipboard
{
    Send, ^c
    ClipWait, 1
}

voltas_turmas := Clipboard
Sleep, 50

While Clipboard
{
    Clipboard :=
    Sleep, 50
}

ControlSend, , {Control Down}{Home}{Control Up}, Rematrícula em Lote - Controle de Turmas
Sleep, 333