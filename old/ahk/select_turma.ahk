#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

WinWaitActive, Consulta de Turmas
Sleep, 333

#Include ahk\turma_futura.ahk

While Clipboard != turma_futura
{
    Clipboard := turma_futura
    Sleep, 50
}

Send, ^v
Sleep, 50

While Clipboard
{
    Clipboard :=
    Sleep, 50
}

ControlSend, , {Enter}, Consulta de Turmas

WinWaitNotActive, Consulta de Turmas

WinWaitActive, Consulta de Turmas
Sleep, 333

Loop, 50
{
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 404, 308, 490, 320, 0x000000, 0, Fast RGB
    Sleep, 50
}
Until ErrorLevel = 0

If (ErrorLevel)
{
    WinClose, Consulta de Turmas

    WinWaitClose, Consulta de Turmas

    Goto, fecha
}

CoordMode, Mouse, Screen	; Considera a coordenada pela tela
Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
Click, 580, 315 Left, 1
Sleep, 333
Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
Sleep, 100

Loop
{
    While !Clipboard
    {
        Send, ^c
        ClipWait, 1
    }

    If (Clipboard = turma_futura)
    {
        While Clipboard
        {
            Clipboard :=
            Sleep, 50
        }

        Break
    }

    While Clipboard
    {
        Clipboard :=
        Sleep, 50
    }

    ControlSend, , {Down}, Consulta de Turmas
    Sleep, 10
}

ControlSend, , {Enter}, Consulta de Turmas

WinWaitNotActive, Consulta de Turmas

WinWaitActive, Rematricula
Sleep, 333

ControlSend, , {Space}, Rematricula

WinWaitClose, Rematricula
Sleep, 2000

IfWinExist, Validação
{
    ControlSend, , {Space}, Validação

    WinWaitClose, Validação
}

WinWaitClose, Consulta de Turmas