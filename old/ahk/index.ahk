#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

#Include ahk\le_linha_arquivo.ahk

#Include ahk\nav_ini.ahk

#Include ahk\busca_periodo.ahk

#Include ahk\copia_turmas.ahk

Loop, %voltas_turmas%
{
    #Include ahk\ordena_turma.ahk

    #Include ahk\select_alunos.ahk

    #Include ahk\select_turma.ahk

    #Include ahk\gerar_contrato.ahk

    #Include ahk\fim_loop.ahk
}

ExitApp