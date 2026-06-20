import requests

def consultaTurmas(tokenDinamico, listaMatrizes):
  
  for turmas in listaMatrizes:

    url = "https://portalufbra-developer.jacad.com.br/api/v1/academico/turmas?turmaIdPeriodoLetivo=227&turmaStatus=ATIVA&pageSize=500"

    payload = {}

    headers = {'Authorization': f"Bearer {tokenDinamico}"}

    response = requests.request("GET", url, headers=headers, data=payload)

    print(response.text)