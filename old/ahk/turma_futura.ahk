#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

If InStr(turma, "1º SEMESTRE")
{
    StringReplace, turma_futura, turma, 1º SEMESTRE, 2º SEMESTRE

    Goto, fim_turma
}

If InStr(turma, "2º SEMESTRE")
{
    StringReplace, turma_futura, turma, 2º SEMESTRE, 3º SEMESTRE

    Goto, fim_turma
}

If InStr(turma, "3º SEMESTRE")
{
    StringReplace, turma_futura, turma, 3º SEMESTRE, 4º SEMESTRE

    Goto, fim_turma
}

If InStr(turma, "4º SEMESTRE")
{
    StringReplace, turma_futura, turma, 4º SEMESTRE, 5º SEMESTRE

    Goto, fim_turma
}

If InStr(turma, "5º SEMESTRE")
{
    StringReplace, turma_futura, turma, 5º SEMESTRE, 6º SEMESTRE

    Goto, fim_turma
}

If InStr(turma, "6º SEMESTRE")
{
    StringReplace, turma_futura, turma, 6º SEMESTRE, 7º SEMESTRE

    Goto, fim_turma
}

If InStr(turma, "7º SEMESTRE")
{
    StringReplace, turma_futura, turma, 7º SEMESTRE, 8º SEMESTRE

    Goto, fim_turma
}

If InStr(turma, "8º SEMESTRE")
{
    StringReplace, turma_futura, turma, 8º SEMESTRE, 9º SEMESTRE

    Goto, fim_turma
}

If InStr(turma, "9º SEMESTRE")
{
    StringReplace, turma_futura, turma, 9º SEMESTRE, 10º SEMESTRE

    Goto, fim_turma
}

fim_turma: