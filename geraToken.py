import requests

def geraTokenDinamico(marca):
    
    if marca == "auden":
        
        tokenFixo = "879e1c3bf5ac0eda4066ceb386a27029"
        
    else:
        
        tokenFixo = "6ba9cd6b7b11a0b59393b3dd4bd9395a"

    url = f"https://{marca}-developer.jacad.com.br/api/v1/auth/token"

    payload = {}

    headers = {'token': f'{tokenFixo}'}

    response = requests.request("POST", url, headers=headers, data=payload)

    tokenDinamico = response.json().get("token")

    return tokenDinamico