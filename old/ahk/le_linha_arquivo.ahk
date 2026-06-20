#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

IniRead, swa, C:\Bots\config.ini, Versao do SWA, vVersao_swa

hostname := A_ComputerName  ; Mesmo que socket.gethostname()
ip := ""

for adapter in ComObjGet("winmgmts:\\.\root\cimv2").ExecQuery("SELECT IPAddress FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = TRUE")
{
    if (adapter.IPAddress[0]) { ; IPv4 é sempre o índice [0]
        ip := adapter.IPAddress[0]
        break
    }
}

arquivo := "variaveis_" . ip . ".tsv"

FileRead, linha_arquivo, %arquivo%

array := StrSplit(linha_arquivo, ";")

id_periodo := array[1]