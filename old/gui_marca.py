import tkinter as tk
from  tkinter import ttk

def popula_input_id_org():

    input_marca ['values'] = ["UNIBTA", "UFBRA"]

def obter_valor_selecionado():
    
    global marca

    marca = input_marca.get().lower()
    
    janela.destroy()

# Criar janela
janela = tk.Tk()
janela.title("Bot de Renomear Turmas")

# Criar entrada de texto
label = tk.Label(janela, width=45, text="Selecione a Marca:")
label.pack(pady=0)

input_marca = ttk.Combobox(janela, width=25, state="readonly")
input_marca.pack(padx=10, pady=10)

popula_input_id_org()

# Criar botão para obter o texto inserido
botao = tk.Button(janela, text="Selecionar Marca", command=obter_valor_selecionado)
botao.pack()

# Executar interface
janela.mainloop()