#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

WinActivate, Rematrícula em Lote - Controle de Turmas
Sleep, 333

Loop, 4
{
    ControlSend, , {Tab}, Rematrícula em Lote - Controle de Turmas
    Sleep, 75
}

ControlSend, , {Space}, Rematrícula em Lote - Controle de Turmas
Sleep, 333

WinWaitNotActive, Rematrícula em Lote - Controle de Turmas
Sleep, 333

WinActivate, Consulta de Períodos Letivos
Sleep, 333

Loop, 6
{
    ControlSend, , {Tab}, Consulta de Períodos Letivos
    Sleep, 75
}

ControlSend, , {Shift Down}{Control Down}{End}{Control Up}{Shift Up}, Consulta de Períodos Letivos
Sleep, 333

While Clipboard
{
	Clipboard :=
    Sleep, 50
}

While !Clipboard
{
	Send, ^c
	ClipWait, 1
}

lista_id := StrSplit(Clipboard, "`r`n")

While Clipboard
{
	Clipboard :=
    Sleep, 50
}

ControlSend, , {Control Down}{Home}{Control Up}, Consulta de Períodos Letivos
Sleep, 333

for index, id_swa in lista_id
{
	If (id_periodo = id_swa)
	{
		linha := index-1
    	Sleep, 50

		Break
	}
}

If (linha = 0)
{
	Goto, copiar_polo2
}

If (linha <= 9)
{
	Loop, %linha%
	{
		ControlSend, , {Down}, Consulta de Períodos Letivos
		Sleep, 100
	}
}

If (linha >= 10)
{
	If (linha <= 99)
	{
		StringTrimRight, dec, linha, 1

		StringTrimLeft, un, linha, 1

		dec := Floor(dec*10/14)

		un := Floor(un/14)
		
		Loop, %dec%
		{
			ControlSend, , {PgDn}, Consulta de Períodos Letivos
			Sleep, 100
		}
		
		If (un > 0)
		{
			Loop, %un%
			{
				ControlSend, , {Down}, Consulta de Períodos Letivos
				Sleep, 100
			}
		}
	}
}

If (linha >= 100)
{
	If (linha <= 999)
	{
		StringLeft, dec, linha, 2

		StringRight, un, linha, 1

		dec := Floor(dec*10/14)

		un := Floor(un/14)
		
		Loop, %dec%
		{
			ControlSend, , {PgDn}, Consulta de Períodos Letivos
			Sleep, 100
		}
		
		If(un > 0)
		{
			Loop, %un%
			{
				ControlSend, , {Down}, Consulta de Períodos Letivos
				Sleep, 100
			}
		}
	}
}

If (linha >= 1000)
{
	If (linha <= 9999)
	{
		StringLeft, dec, linha, 3
		
		StringRight, un, linha, 1

		dec := Floor(dec*10/14)

		un := Floor(un/14)
		
		Loop, %dec%
		{
			ControlSend, , {PgDn}, Consulta de Períodos Letivos
			Sleep, 100
		}
		
		If(un > 0)
		{
			Loop, %un%
			{
				ControlSend, , {Down}, Consulta de Períodos Letivos
				Sleep, 100
			}
		}
	}
}

copiar_polo2:
Loop
{
	While !Clipboard
	{
		Send, ^c
		ClipWait, 1
	}

	If (Clipboard = id_periodo)
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
	
	ControlSend, , {Down}, Consulta de Períodos Letivos
	Sleep, 10
}

ControlSend, , {Enter}, Consulta de Períodos Letivos

WinWaitNotActive, Consulta de Períodos Letivos
Sleep, 333