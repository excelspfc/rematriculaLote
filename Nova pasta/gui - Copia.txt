import tkinter as tk
from  tkinter import ttk
from buscaPeriodos import buscaDescPeriodo, buscaIdPeriodoLet

def gui(marca, tokenDinamico, listaOrg):

    def populaInputPerLet():

        global idOrg
    
        botao2 = None

        idOrg = inputOrg.get()

        inputPerLet.set('')

        listaDescPeriodoLet = buscaDescPeriodo(tokenDinamico, idOrg, marca)

        inputPerLet['values'] = listaDescPeriodoLet

        if botao2 is None:
        
            botao2 = tk.Button(janela, text="Selecionar Período Letivo", command=lambda: getIdPerLet(inputPerLet))
            botao2.pack()

    def getIdPerLet(inputPerLet):

        global idPeriodoLet
        
        global idPeriodoLetivoDestino

        desc = inputPerLet.get()

        idPeriodoLet, idPeriodoLetivoDestino = buscaIdPeriodoLet(desc, tokenDinamico, idOrg, marca)

        janela.destroy()

    # Criar janela
    janela = tk.Tk()
    janela.title("Bot de Renomear Turmas")

    # Criar entrada de texto
    label = tk.Label(janela, text="Selecione a Org:", width=45)
    label.pack(pady=0)

    inputOrg = ttk.Combobox(janela, width=15, state="readonly")
    inputOrg.pack(padx=10, pady=10)

    # Criar botão para obter o texto inserido
    botao = tk.Button(janela, text="Selecionar Org", command=populaInputPerLet)
    botao.pack()

    # Criar entrada de texto
    label2 = tk.Label(janela, text="Selecione o Período Letivo:")
    label2.pack(pady=0)

    inputPerLet = ttk.Combobox(janela, width=20, state="readonly")
    inputPerLet.pack(padx=10, pady=10)

    janela.after(100, lambda: inputOrg.configure(values=listaOrg))

    # Executar interface
    janela.mainloop()
    
    return idPeriodoLet, idPeriodoLetivoDestino