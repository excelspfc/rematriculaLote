import requests

def busca_desc_periodo(token, id_org, marca):

  url = f"https://portal{marca}-developer.jacad.com.br/api/v1/academico/periodos-letivos/?idOrg={id_org}&pageSize=500&situacao=ABERTO"

  payload = {}

  headers = {'Authorization': f'Bearer {token}'}

  response = requests.request("GET", url, headers=headers, data=payload)

  response_json = response.json()
  
  descricoes_periodo = [periodo.get('descricao') for periodo in response_json.get('elements', [])]
  
  return descricoes_periodo

def busca_id_periodo(desc, token, id_org, marca):

  url = f"https://portal{marca}-developer.jacad.com.br/api/v1/academico/periodos-letivos/?idOrg={id_org}&search={desc}&pageSize=500&situacao=ABERTO"

  payload = {}

  headers = {'Authorization': f'Bearer {token}'}

  response = requests.request("GET", url, headers=headers, data=payload)

  response_json = response.json()
  
  id_periodo = [periodo.get('idPeriodoLetivo') for periodo in response_json.get('elements', [])]
  
  return id_periodo[0]