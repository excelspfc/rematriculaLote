import requests

def consultaDisciplinasTurma(marca, tokenDinamico, listaMatriculasDestino):
    
    disciplinasAgrupadas = {}
    
    matriculasProntas = []
    
    i = 0

    for matricula in listaMatriculasDestino:
        
        i += 1

        idAlunoCursoIngresso = matricula[0]
        
        idTurmaDestino = matricula[1]
        
        idPeriodoLetivoDestino = matricula[2]

        chave = (idAlunoCursoIngresso, idTurmaDestino, idPeriodoLetivoDestino)

        if chave not in disciplinasAgrupadas:
            
            disciplinasAgrupadas[chave] = []

        print(f"Consultando disciplinas da turma... Página {i}")

        url = f"https://{marca}-developer.jacad.com.br/api/v1/academico/turmas/{idTurmaDestino}/disciplinas?pageSize=500"

        headers = {'Authorization': f"Bearer {tokenDinamico}"}

        response = requests.get(url, headers=headers)
        
        responseJson = response.json()

        listaDisciplinas = responseJson.get('elements', [])

        for disciplina in listaDisciplinas:
            
            idDisciplinaProfessor = disciplina.get('idDisciplinaProfessor')

            disciplinasAgrupadas[chave].append(idDisciplinaProfessor)
            
        matriculasProntas.append((idAlunoCursoIngresso, idPeriodoLetivoDestino, idTurmaDestino, disciplinasAgrupadas[chave]))

    return matriculasProntas