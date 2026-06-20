import requests

def consultaTurmasDestino(marca, tokenDinamico, idPeriodoLetivoDestino):

    paginaAtual = 0

    listaTurmasFiltradas = []

    while True:
        
        print(f"Consultando turmas destino... Página {paginaAtual}")
        
        url = f"https://{marca}-developer.jacad.com.br/api/v1/academico/turmas?turmaIdPeriodoLetivo={idPeriodoLetivoDestino}&turmaStatus=ATIVA&pageSize=500&currentPage={paginaAtual}"

        headers = {'Authorization': f"Bearer {tokenDinamico}"}

        response = requests.get(url, headers=headers)

        responseJson = response.json()

        listaTurmas = responseJson.get('elements', [])

        if not listaTurmas:

            break
        
        for turma in listaTurmas:
            
            turmaNomeRedDestino = turma.get('turmaNomeRed')

            idTurmaDestino = turma.get('idTurma')

            listaTurmasFiltradas.append((turmaNomeRedDestino, idTurmaDestino, idPeriodoLetivoDestino))

        paginaAtual += 1
    
    return listaTurmasFiltradas