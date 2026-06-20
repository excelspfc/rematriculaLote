import subprocess, os
from variaveis_pastas import pasta_raiz, arquivo_integracao, arquivo_ahk

def loop(turmas, mes, id_org):
  
    for idTurma, turmaNome, turmaNomeRed, turmaDescricao in turmas:

        if mes in turmaNome and mes in turmaNomeRed and mes in turmaDescricao:
            
            print (f'Turma de ID {idTurma} - {turmaNome} já se encontra com a nomenclatura devida')           

        else:
            
            if os.path.exists(pasta_raiz + arquivo_integracao):

                os.remove(pasta_raiz + arquivo_integracao)

            with open(pasta_raiz + arquivo_integracao, 'a') as arquivo:

                arquivo.write(f"{idTurma};{mes};{id_org}")

            arquivo.close()
            
            subprocess.Popen([arquivo_ahk], shell=True).wait()
            
            print (f'Turma de ID {idTurma} - {turmaNome} Ajustado')