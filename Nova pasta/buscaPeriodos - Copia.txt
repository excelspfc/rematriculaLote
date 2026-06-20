import requests

def buscaDescPeriodo(tokenDinamico, idOrg, marca):

  url = f"https://{marca}-developer.jacad.com.br/api/v1/academico/periodos-letivos/?idOrg={idOrg}&pageSize=500&situacao=ABERTO"

  payload = {}

  headers = {'Authorization': f'Bearer {tokenDinamico}'}

  response = requests.request("GET", url, headers=headers, data=payload)

  response_json = response.json()
  
  listaDescPeriodoLet = [periodo.get('descricao') for periodo in response_json.get('elements', [])]
  
  return listaDescPeriodoLet

def buscaIdPeriodoLet(desc, tokenDinamico, idOrg, marca):

  url = f"https://{marca}-developer.jacad.com.br/api/v1/academico/periodos-letivos/?idOrg={idOrg}&search={desc}&pageSize=500&situacao=ABERTO"

  payload = {}

  headers = {'Authorization': f'Bearer {tokenDinamico}'}

  response = requests.request("GET", url, headers=headers, data=payload)

  response_json = response.json()
  
  id_periodo = [periodo.get('idPeriodoLetivo') for periodo in response_json.get('elements', [])]
  

  idProximoPeriodoLetivo = [periodo.get('idProximoPeriodoLetivo') for periodo in response_json.get('elements', [])]

  return id_periodo[0], idProximoPeriodoLetivo[0]