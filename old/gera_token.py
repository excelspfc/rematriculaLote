import requests

def gera_token(marca):

    url = f"https://portal{marca}-developer.jacad.com.br/api/v1/auth/token"

    payload = {}
    
    headers = {'token': '6ba9cd6b7b11a0b59393b3dd4bd9395a'}

    response = requests.request("POST", url, headers=headers, data=payload)
    
    try:
        token = response.json().get("token")
        
    except ValueError:
        print("Erro ao processar a resposta JSON.")
        
    return token