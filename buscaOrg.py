import requests

def buscaOrg(tokenDinamico, marca):

  url = f"https://{marca}-developer.jacad.com.br/api/v1/basicos/organizacoes?pageSize=500"

  payload = {}

  headers = {'Authorization': f'{tokenDinamico}'}

  listaOrg = []

  response = requests.request("GET", url, headers=headers, data=payload)
  
  response_json = response.json()

  listaOrg.extend([org.get('idOrganizacao') for org in response_json.get('elements', [])])

  return listaOrg