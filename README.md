# Automação de Rematrícula Jacad (Python)

Este projeto automatiza o processo de rematrícula para as instituições **UNIBTA**, **UFBRA** e **AUDEN**, integrando-se diretamente à API da Jacad para processar alunos ativos e realizar a transição para o próximo período letivo de forma sistêmica.

## 📌 Visão Geral

O sistema foi desenvolvido de forma modular para realizar o ciclo completo de rematrícula:
1.  **Autenticação Dinâmica**: Gera tokens de acesso temporários para segurança das requisições.
2.  **Filtro de Candidatos**: Localiza alunos com status `ATIVA` no período atual.
3.  **Lógica de Progressão (n + 1)**: Identifica automaticamente a turma do próximo semestre, tratando inclusive turmas de ADP.
4.  **Configuração de Pagamento**: Aplica automaticamente o plano de pagamento correto (ID 3120 para UFBRA e 2642 para as demais unidades).
5.  **Efetivação**: Realiza a matrícula vinculando todas as disciplinas da turma de destino [6, 7].

## 🛠️ Estrutura de Arquivos

*   **`main.py`**: Orquestrador do fluxo principal.
*   **`guiMarca.py` / `gui.py`**: Interfaces gráficas (Tkinter) para seleção de marca, organização e períodos.
*   **`geraToken.py`**: Gerenciador da autenticação via token dinâmico.
*   **`consultaMatricula.py`**: Busca alunos elegíveis no período letivo de origem.
*   **`apontaSemestre.py`**: Motor de regras para definição da turma de destino.
*   **`consultaDisciplinasTurma.py`**: Recupera a grade de disciplinas da nova turma.
*   **`rematricula.py`**: Módulo final que executa o POST de criação da matrícula.

## 🚀 Como Iniciar

### Pré-requisitos
*   Python 3.x
*   Biblioteca `requests`

### Instalação
```bash
pip install requests
Configuração de Segurança
O arquivo geraToken.py utiliza um cabeçalho fixo para obter o token dinâmico
. Recomendação: Em ambiente de produção, utilize variáveis de ambiente para proteger essas credenciais.
Execução
Inicie o processo pelo arquivo principal:
python main.py
⚙️ Regras de Negócio Implementadas
Status de Aluno: Apenas alunos com matrículas "vivas" são processados
.
Paginação: O sistema lida com grandes volumes de dados usando pageSize=500 e navegação por páginas nas consultas à API
.
Data de Vencimento: Por padrão, a data da primeira parcela é configurada para um valor de controle (ex: 2999-12-31) conforme a lógica interna do script
.
Confirmação: O sistema reporta sucesso apenas após o status code 201 da API
.
Este projeto foi desenvolvido para otimizar a operação acadêmica das marcas UNIBTA, UFBRA e AUDEN.
.