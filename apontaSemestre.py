import re

def apontaSemestre(listaMatriculasFiltradas, listaTurmasFiltradas):

    listaMatriculasDestino = []
    
    i = 0
    
    for matriculasFiltradas in listaMatriculasFiltradas:
        
        i += 1
        
        idAlunoCursoIngresso = matriculasFiltradas[0]
        
        descTurmaReduzidaOrigem = matriculasFiltradas[1]
        
        if descTurmaReduzidaOrigem == "EES-ON(ESP)" or "OLDS" in descTurmaReduzidaOrigem:
            
            continue
        
        if "ADP" in descTurmaReduzidaOrigem:
    
            semestreIncompleto = descTurmaReduzidaOrigem[-7:]
        
        else:

            semestreIncompleto = descTurmaReduzidaOrigem[-3:]

        semestreAtual = int(semestreIncompleto[:1])

        if semestreAtual != 0:

            semestreDestino = semestreAtual + 1

            descTurmaReduzidaDestino = re.sub(r"\((\d+)S\)",f"({semestreDestino}S)", descTurmaReduzidaOrigem)
            
            for turmasFiltradas in listaTurmasFiltradas:

                turmaNomeRedDestino = turmasFiltradas[0]

                idTurmaDestino = turmasFiltradas[1]
                
                idPeriodoLetivoDestino = turmasFiltradas[2]

                if descTurmaReduzidaDestino == turmaNomeRedDestino:
                    
                    listaMatriculasDestino.append((idAlunoCursoIngresso, idTurmaDestino, idPeriodoLetivoDestino))
                    
                    break
    
    return listaMatriculasDestino