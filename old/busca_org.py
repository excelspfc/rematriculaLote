import requests

def busca_org(token, marca):

  url = f"https://portal{marca}-developer.jacad.com.br/api/v1/basicos/organizacoes?pageSize=500"

  payload = {}

  headers = {'Authorization': f'{token}'}

  orgs = []

  response = requests.request("GET", url, headers=headers, data=payload)
  
  response_json = response.json()

  orgs.extend([org.get('idOrganizacao') for org in response_json.get('elements', [])])

  return orgs