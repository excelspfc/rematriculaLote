#pyinstaller --onefile --icon=Icone_I9.ico main.py

from guiMarca import geraMarca
from geraToken import geraTokenDinamico
from buscaOrg import buscaOrg
from gui import gui
from consultaMatricula import consultaMatriculas
from consultaTurmaDestino import consultaTurmasDestino
from apontaSemestre import apontaSemestre
from consultaDisciplinasTurma import consultaDisciplinasTurma
from rematricula import rematricula

def main():

    marca = geraMarca()
    
    tokenDinamico = geraTokenDinamico(marca)
    
    listaOrg = buscaOrg(tokenDinamico, marca)
    
    idPeriodoLet, idPeriodoLetivoDestino = gui(marca, tokenDinamico, listaOrg)

    listaMatriculasFiltradas = consultaMatriculas(tokenDinamico, marca, idPeriodoLet)

    listaTurmasFiltradas = consultaTurmasDestino(marca, tokenDinamico, idPeriodoLetivoDestino)
    
    listaMatriculasDestino = apontaSemestre(listaMatriculasFiltradas, listaTurmasFiltradas)
    
    matriculasProntas = consultaDisciplinasTurma(marca, tokenDinamico, listaMatriculasDestino)

    rematricula(marca, tokenDinamico, matriculasProntas)

if __name__ == '__main__':
    
    main()