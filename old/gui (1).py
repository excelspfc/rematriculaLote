import subprocess, os
import tkinter as tk
from  tkinter import ttk
from gui_marca import marca
from gera_token import gera_token
from busca_org import busca_org
from busca_periodos import busca_desc_periodo, busca_id_periodo
from variaveis_pastas import arquivo_integracao, arquivo_ahk
import socket

# Cria um socket para "descobrir" o IP local
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.connect(("8.8.8.8", 80))  # Conecta ao DNS público do Google
ip = s.getsockname()[0]
s.close()
ip_address = ip

marca = marca

token = gera_token(marca)

botao2 = None

def popula_input_id_org():
    
    orgs = busca_org (token, marca)

    input_org['values'] = orgs

def popula_input_per():
    
    global id_org
    
    global descricao_periodo
    
    global botao2

    id_org = input_org.get()
    
    input_per.set('')
    
    descricao_periodo = busca_desc_periodo(token, id_org, marca)
    
    input_per['values'] = descricao_periodo
    
    if botao2 is None:
    
        botao2 = tk.Button(janela, text="Selecionar Período Letivo", command=lambda: get_id_per(input_per))
        botao2.pack()

def get_id_per(input_per):
    
    global id_periodo
    
    global desc
    
    global marca
    
    desc = input_per.get()
    
    id_periodo = busca_id_periodo(desc, token, id_org, marca)
    
    if os.path.exists(f"{arquivo_integracao}_{ip_address}.tsv"):

        os.remove(f"{arquivo_integracao}_{ip_address}.tsv")

    with open(f"{arquivo_integracao}_{ip_address}.tsv", 'a') as arquivo:

        arquivo.write(f"{id_periodo}")

    arquivo.close()
    
    janela.destroy()

# Criar janela
janela = tk.Tk()
janela.title("Bot de Renomear Turmas")

# Criar entrada de texto
label = tk.Label(janela, text="Selecione a Org:", width=45)
label.pack(pady=0)

input_org = ttk.Combobox(janela, width=15, state="readonly")
input_org.pack(padx=10, pady=10)

# Criar botão para obter o texto inserido
botao = tk.Button(janela, text="Selecionar Org", command=popula_input_per)
botao.pack()

# Criar entrada de texto
label2 = tk.Label(janela, text="Selecione o Período Letivo:")
label2.pack(pady=0)

input_per = ttk.Combobox(janela, width=20, state="readonly")
input_per.pack(padx=10, pady=10)

janela.after(100, popula_input_id_org)

# Executar interface
janela.mainloop()