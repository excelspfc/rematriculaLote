import requests

def consultaMatriculas(tokenDinamico, marca, idPeriodoLet):
    
    paginaAtual = 0

    listaMatriculasFiltradas = []
            
    i = 1

    while True:

        print(f"Consultando matrículas... Página {paginaAtual}")

        url = f"https://{marca}-developer.jacad.com.br/api/v1/academico/matriculas?pageSize=500&idPeriodoLetivo={idPeriodoLet}&currentPage={paginaAtual}"

        headers = {'Authorization': f"Bearer {tokenDinamico}"}

        response = requests.get(url, headers=headers)

        responseJson = response.json()
        
        listaMatriculas = responseJson.get('elements', [])
        
        if not listaMatriculas:

            break
        
        for matricula in listaMatriculas:

            if matricula.get('status') in ["ATIVA"]:

                idAlunoCursoIngresso = matricula.get('idAlunoCursoIngresso')

                turmaReduzida = matricula.get('turma')
                
                idMatriz = matricula.get('idCursoMatriz')

                listaMatriculasFiltradas.append((idAlunoCursoIngresso, turmaReduzida, idMatriz))

        paginaAtual += 1

    return listaMatriculasFiltradas