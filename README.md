Bot de Rematrícula Automatizada - Integração API Jacad

Este projeto é uma solução em Python desenvolvida para automatizar o processo de rematrícula de alunos veteranos nas instituições UNIBTA, UFBRA e AUDEN, utilizando a API de desenvolvedor da Jacad
. O sistema realiza desde a autenticação segura até a efetivação da matrícula no período letivo subsequente, eliminando processos manuais e reduzindo erros de enturmação
.
🚀 Funcionalidades
Seleção de Instituição (Multi-brand): Interface para escolha dinâmica entre as marcas configuradas (UNIBTA/UFBRA)
.
Gestão de Autenticação: Geração de Tokens Dinâmicos para garantir a segurança em todas as requisições POST e GET
.
Filtragem Inteligente: Identifica alunos com status "ATIVA" no período letivo atual
.
Progressão Acadêmica Automática: Lógica integrada para identificar a turma de destino com base no semestre atual do aluno (n + 1), incluindo tratamento para turmas de ADP
.
Mapeamento de Disciplinas: Consulta automática das disciplinas vinculadas à turma de destino para garantir a integridade da grade curricular
.
Regras de Negócio Financeiras: Aplicação automática de IDs de planos de pagamento específicos por marca (ex: Plano 3120 para UFBRA e 2642 para as demais)
.
🛠️ Tecnologias Utilizadas
Python 3.x
Requests: Para consumo da API REST
.
Tkinter: Para a interface gráfica de usuário (GUI)
.
Datetime: Para gestão de datas de matrícula e parcelas
.
📂 Estrutura do Projeto
O sistema é modular, dividido em funções específicas para facilitar a manutenção:
main.py: Ponto de entrada que coordena o fluxo entre os módulos
.
guiMarca.py / gui.py: Interfaces para seleção de marca, organização e períodos
.
geraToken.py: Gerenciamento do token dinâmico de autenticação
.
consultaMatricula.py: Busca de alunos aptos no período atual
.
apontaSemestre.py: Lógica de "de-para" para turmas e semestres
.
rematricula.py: Execução do POST final para criação da nova matrícula
.
🔧 Como Usar
Instale as dependências:
Configuração de Segurança:
Aviso: O arquivo geraToken.py contém uma chave de acesso estática
. Recomenda-se mover esta chave para um arquivo .env e não versioná-lo.
Execute o script principal:
Siga as instruções na interface gráfica para selecionar a marca, a organização e o período letivo de origem
. O bot processará automaticamente a lista de alunos e realizará as rematrículas
.
⚠️ Segurança e Boas Práticas
Este repositório utiliza tokens de autorização e URLs específicas de ambiente de desenvolvedor
. Certifique-se de:
Nunca expor tokens reais em repositórios públicos.
Utilizar o arquivo .gitignore para proteger dados sensíveis.
Validar os retornos da API (o script já realiza logs de sucesso e falha via status code)
.
Notas Adicionais:
O sistema foi projetado para lidar com grandes volumes de dados através de paginação automática (pageSize=500) nas consultas de matrículas e turmas
.
A rematrícula é confirmada apenas se a API retornar o status code 201
.
