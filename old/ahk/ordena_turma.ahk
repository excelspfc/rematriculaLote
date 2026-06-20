#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

WinActivate, Rematrícula em Lote - Controle de Turmas
Sleep, 333

Loop, 2
{
    BlockInput, MouseMove	; Bloqueia o movimento do cursor do mouse
    CoordMode, Mouse, Screen	; Considera a coordenada pela tela
    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    ControlClick, , Rematrícula em Lote - Controle de Turmas,, Left, 1,  x1000 y280 NA	; Clica com o botão esquerdo na coordenada retornada
    ControlClick, , Rematrícula em Lote - Controle de Turmas,, Left, 1,  x1000 y280 NA	; Clica com o botão esquerdo na coordenada retornada
    BlockInput, MouseMoveOff	; Desbloqueia o movimento do cursor do mouse
    Sleep, 500
}

BlockInput, MouseMove	; Bloqueia o movimento do cursor do mouse
CoordMode, Mouse, Screen	; Considera a coordenada pela tela
Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
ControlClick, , Rematrícula em Lote - Controle de Turmas,, Left, 1,  x375 y300 NA	; Clica com o botão esquerdo na coordenada retornada
BlockInput, MouseMoveOff	; Desbloqueia o movimento do cursor do mouse
Sleep, 333

While !Clipboard
{
    Send, ^c
    ClipWait, 1
}

index_voltas_turmas := A_Index
Sleep, 50

While Clipboard != index_voltas_turmas
{
    While Clipboard
    {
        Clipboard :=
        Sleep, 50
    }

    ControlSend, , {Down}, Rematrícula em Lote - Controle de Turmas
    Sleep, 10

    While !Clipboard
    {
        Send, ^c
        ClipWait, 1
    }
}

While Clipboard
{
    Clipboard :=
    Sleep, 50
}

;ControlSend, , {Right 5}, Rematrícula em Lote - Controle de Turmas
ControlSend, , {Right 4}, Rematrícula em Lote - Controle de Turmas
Sleep, 100

While !Clipboard
{
    Send, ^c
    ClipWait, 1
}

turma := Clipboard
Sleep, 50

While Clipboard
{
    Clipboard :=
    Sleep, 50
}

#Include ahk\ultimo_semestre.ahk

ControlSend, , {Right}, Rematrícula em Lote - Controle de Turmas
Sleep, 100

While !Clipboard
{
    Send, ^c
    ClipWait, 1

    If (Clipboard < 1)
    {
        While Clipboard
        {
            Clipboard :=
            Sleep, 50
        }

        WinClose, Rematrícula em Lote - Controle de Turmas

        WinWaitClose, Rematrícula em Lote - Controle de Turmas

        brecado := 1

        Break
    }
}

If (brecado = 1)
{
    Break
}

voltas_alunos := Clipboard

While Clipboard
{
    Clipboard :=
    Sleep, 50
}

ControlSend, , {Control Down}{Tab}{Control Up}, Rematrícula em Lote - Controle de Turmas
Sleep, 333

ControlSend, , {Space}, Rematrícula em Lote - Controle de Turmas
Sleep, 100

WinWaitNotActive, Rematrícula em Lote - Controle de Turmas
Sleep, 333