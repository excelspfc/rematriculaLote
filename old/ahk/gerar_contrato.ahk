#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

WinWaitActive, Rematrícula em Lote - Rematricular Alunos
Sleep, 333

While Clipboard
{
    Clipboard :=
    Sleep, 50
}

BlockInput, MouseMove	; Bloqueia o movimento do cursor do mouse
CoordMode, Mouse, Screen	; Considera a coordenada pela tela
Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
ControlClick, , Rematrícula em Lote - Rematricular Alunos,, Left, 1,  x700 y270 NA	; Clica com o botão esquerdo na coordenada retornada
BlockInput, MouseMoveOff	; Desbloqueia o movimento do cursor do mouse
Sleep, 100

ControlSend, , {r}{Enter}, Rematrícula em Lote - Rematricular Alunos
Sleep, 150

Loop, 2
{
    ControlSend, , {Shift Down}{Tab}{Shift Up}, Rematrícula em Lote - Rematricular Alunos
    Sleep, 150
}

ControlSend, , {Space}, Rematrícula em Lote - Rematricular Alunos
Sleep, 2000

Loop, 50
{
    CoordMode, Pixel, Screen
    PixelSearch, FoundX, FoundY, 312, 306, 423, 344, 0x000000, 0, Fast RGB
    Sleep, 50
}
Until ErrorLevel = 0

If (ErrorLevel)
{
    Goto, fecha
}


/*
    BlockInput, MouseMove	; Bloqueia o movimento do cursor do mouse

    CoordMode, Mouse, Screen	; Considera a coordenada pela tela
    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    Click, 750, 295 Left, 2
    Sleep, 333
    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    Sleep, 150
    Click, 655, 295 Left, 2
    Sleep, 333
    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    Sleep, 150
    Click, 660, 315 Left, 1
    Sleep, 150
    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    BlockInput, MouseMoveOff	; Desbloqueia o movimento do cursor do mouse
    Sleep, 150
*/

/*
    BlockInput, MouseMove	; Bloqueia o movimento do cursor do mouse
    CoordMode, Mouse, Screen	; Considera a coordenada pela tela
    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    Loop, 2
    {
    Click, 750, 295 Left, 2
    Sleep, 666
    }
    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    BlockInput, MouseMoveOff	; Desbloqueia o movimento do cursor do mouse
    /*
    Loop, 150
    {
        CoordMode, Pixel, Window
        ImageSearch, FoundX, FoundY, 0, 0, 1600, 900, imagens\Screen_20251117104635.png
        Sleep, 100
    }
    Until ErrorLevel = 0

    */

    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    Sleep, 100
    Loop, 2
    {
    Click, 655, 295 Left, 2
    Sleep, 666
    }
    Sleep, 333
    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada

    /*
    Loop, 150
    {
        CoordMode, Pixel, Window
        ImageSearch, FoundX, FoundY, 0, 0, 1600, 900, imagens\Screen_20251117104939.png
        Sleep, 100
    }
    Until ErrorLevel = 0

    */


    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    Sleep, 100
    Click, 660, 315 Left, 1
    Sleep, 100
    Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
    BlockInput, MouseMoveOff	; Desbloqueia o movimento do cursor do mouse
    Sleep, 100

    ControlSend, , {CtrlDown}{End}{CtrlUp}, Rematrícula em Lote - Rematricular Alunos
    Sleep, 333

    Loop, %voltas_alunos%
    {
        status_curso_ingresso :=
        Sleep, 50

        status_matricula :=
        Sleep, 50

        While !Clipboard
        {
            If (A_Index = 6)
            {
                Goto, fecha
            }

            Send, ^c
            ClipWait, 1
        }

        If (Clipboard != "ATIVO")
        {
            If (A_Index = 1)
            {
                While Clipboard
                {
                    Clipboard :=
                    Sleep, 50
                }

                voltas_alunos :=
                Sleep, 50

                status_curso_ingresso :=
                Sleep, 50

                status_matricula :=
                Sleep, 50

                Goto, fecha
            }

            While Clipboard
            {
                Clipboard :=
                Sleep, 50
            }

            voltas_alunos :=
            Sleep, 50

            status_curso_ingresso :=
            Sleep, 50

            status_matricula :=
            Sleep, 50

            ControlSend, , {Down}, Rematrícula em Lote - Rematricular Alunos
            Sleep, 150

            brecado3 := 1
            Sleep, 50

            Break
        }

        If (brecado3 = 1)
        {
            brecado2 :=
            Sleep, 50

            Break
        }

        ;status_curso_ingresso = Clipboard

        While Clipboard
        {
            Clipboard :=
            Sleep, 50
        }

        ControlSend, , {Right}, Rematrícula em Lote - Rematricular Alunos
        Sleep, 50

        While !Clipboard
        {
            Send, ^c
            ClipWait, 1
        }

        If (Clipboard != "ATIVA")
        {
            If (Clipboard != "Aguardando")
            {
                If (A_Index = 1)
                {
                    While Clipboard
                    {
                        Clipboard :=
                        Sleep, 50
                    }

                    voltas_alunos :=
                    Sleep, 50

                    status_curso_ingresso :=
                    Sleep, 50

                    status_matricula :=
                    Sleep, 50

                    Goto, fecha
                }

                While Clipboard
                {
                    Clipboard :=
                    Sleep, 50
                }

                voltas_alunos :=
                Sleep, 50

                status_curso_ingresso :=
                Sleep, 50

                status_matricula :=
                Sleep, 50

                ControlSend, , {Down}, Rematrícula em Lote - Rematricular Alunos
                Sleep, 150

                Break
            }
        }

        ;status_matricula := Clipboard

        While Clipboard
        {
            Clipboard :=
            Sleep, 50
        }

        ControlSend, , {Left}{up}, Rematrícula em Lote - Rematricular Alunos
        Sleep, 50
    }

    Sleep, 100

    ControlSend, , {CtrlDown}{Shift Down}{End}{Shift Up}{CtrlUp}, Rematrícula em Lote - Rematricular Alunos
    Sleep, 150
*/

ControlSend,,{CtrlDown}{a}{CtrlUp}, Rematrícula em Lote - Rematricular Alunos
Sleep, 333

CoordMode, Mouse, Screen	; Considera a coordenada pela tela
Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
Click, 765, 710 Left, 1
Sleep, 333
Click, 800, 0, 0	; Leva o cursor do mouse para a barra da janela, para que a coordenada do clique do mouse não seja afetada
Sleep, 100

WinWaitNotActive, Rematrícula em Lote - Rematricular Alunos
Sleep, 666

IfWinExist, Informação!
{
    ControlSend, , {Space}, Informação!

    WinWaitClose, Informação!

    Goto, fecha
}

WinWaitActive, Consulta de Planos de Pagamento - Curso
Sleep, 333

While Clipboard != "REMATRÍCULA"
{
    Clipboard := "REMATRÍCULA"
    Sleep, 50
}

Send, ^v
Sleep, 50

While Clipboard
{
    Clipboard :=
    Sleep, 50
}

ControlSend, , {Enter}, Consulta de Planos de Pagamento - Curso

WinWaitNotActive, Consulta de Planos de Pagamento - Curso

WinWaitActive, Consulta de Planos de Pagamento - Curso
Sleep, 333

Loop, 4
{
    ControlSend, , {Tab}, Consulta de Planos de Pagamento - Curso
    Sleep, 150
}

Loop
{
    While !Clipboard
    {
        Send, ^c
        ClipWait, 1
    }

    If (Clipboard = "REMATRÍCULA")
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

    ControlSend, , {Down}, Consulta de Planos de Pagamento - Curso
    Sleep, 10
}

ControlSend, , {Enter}, Consulta de Planos de Pagamento - Curso

WinWaitClose, Consulta de Planos de Pagamento - Curso