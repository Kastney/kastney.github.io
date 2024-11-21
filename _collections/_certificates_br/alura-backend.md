---
layout: certificate
type: course
code: "woojgdCX4Ee9BtmjOlYWXw"
authority: alura
certificate:
    name: "Imersão Dev Back-End"
    workload: "0000-00-00T02:00:00"
competencies: [
    nodejs,
    google-gemini,
    mongodb,
    visual-studio-code
]
---

# Resumo Detalhado da Aula 1 da Imersão Dev Back-End

## 1. Introdução
- Objetivo da Imersão: A imersão tem como foco ensinar os fundamentos do desenvolvimento back-end utilizando Node.js e Express, preparando os alunos para construir APIs.

## 2. Configuração do Ambiente
- Instalação do Node.js: Começamos instalando o Node.js, que é essencial para rodar aplicações JavaScript no servidor.
- Criação do Projeto: Criamos um novo diretório para o projeto e inicializamos um novo projeto Node.js utilizando o comando: npm init -y
- Instalação do Express: Instalamos o Express, um framework para Node.js que facilita a criação de servidores e APIs: npm install express

## 3. Estrutura Básica do Servidor
- Importação do Express: Importamos o Express no nosso arquivo principal (server.js) e criamos uma instância do servidor: const express = require('express'); const app = express();
- Definição da Porta: Definimos a porta em que o servidor irá escutar, geralmente a porta 3000: const PORT = 3000;

## 4. Criando Endpoints
- Rota Inicial: Criamos uma rota básica que responde a requisições GET na raiz do servidor: app.get('/', (req, res) => { res.send('Hello World!'); });
- Iniciando o Servidor: Utilizamos o método listen para iniciar o servidor e escutar na porta definida: app.listen(PORT, () => { console.log(`Servidor rodando na porta ${PORT}`); });

## 5. Testando o Servidor
- Acesso pelo Navegador: Acessamos http://localhost:3000 no navegador para verificar se o servidor estava funcionando corretamente e se a mensagem "Hello World!" era exibida.

## 6. Entendendo Requisições e Respostas
- Requisições HTTP: Discutimos como as requisições HTTP funcionam, incluindo os métodos (GET, POST, etc.) e como o servidor responde a essas requisições.
- Objetos req e res: Aprendemos sobre os objetos req (request) e res (response) que são passados para as funções de rota, permitindo acessar informações da requisição e enviar respostas.

## 7. Códigos de Status HTTP
- Importância dos Códigos: Discutimos a importância dos códigos de status HTTP na comunicação entre cliente e servidor.
  - 200 (OK): Indica que a requisição foi bem-sucedida.
  - 404 (Not Found): Indica que o recurso solicitado não foi encontrado.
- Exemplos de Códigos: Aprendemos sobre outros códigos de status e como eles são utilizados para indicar diferentes resultados de requisições.

## 8. Respostas Personalizadas
- Personalizando Respostas: Aprendemos a personalizar as respostas do servidor, incluindo o uso de diferentes códigos de status e mensagens: app.get('/api', (req, res) => { res.status(200).send('API funcionando!'); });

## 9. Conclusão
- Resumo da Aula: A aula 1 foi fundamental para entender como criar um servidor básico com Node.js e Express, como funcionam as requisições e respostas HTTP, e a importância dos códigos de status.
- Próximos Passos: Na próxima aula, planejamos avançar na construção da nossa API, adicionando mais rotas e funcionalidades.

# Resumo Detalhado da Aula 2 da Imersão Dev Back-End

## 1. Revisão da Aula Anterior
- **Servidor Básico**: Na primeira aula, criamos um servidor utilizando Node.js e Express que escuta requisições na porta 3000.
- **Rota Inicial**: Implementamos uma rota "/api" que responde a requisições GET com um status 200, indicando que a requisição foi bem-sucedida.

## 2. Códigos HTTP
- **Importância dos Códigos**: Discutimos a função dos códigos de status HTTP na comunicação entre cliente e servidor.
  - **200 (OK)**: Indica que a requisição foi bem-sucedida.
  - **404 (Not Found)**: Indica que o recurso solicitado não foi encontrado.
- **Consulta de Códigos**: Aprendemos que podemos consultar códigos HTTP de forma divertida através do site [http.cat](http://http.cat).

## 3. Estrutura de Dados
- **Objetivo**: Precisávamos de uma estrutura para armazenar dados que seriam retornados pela API.
- **Array de Objetos**: Decidimos criar um array que contém objetos representando posts, cada um com:
  - **Descrição**: Uma string que descreve o post.
  - **Imagem**: Um link para uma imagem representativa do post.

## 4. Mock de Dados
- **Uso do Gemini**: Para facilitar o desenvolvimento, utilizamos o Gemini para gerar dados de exemplo.
  - **Criação de Objetos**: Pedimos ao Gemini para criar múltiplos objetos de post com base em um exemplo que já tínhamos.
  - **Placeholder de Imagem**: Utilizamos o link `https://placecats.com/millie/300/150` como um placeholder para as imagens.

## 5. Criação de Rota para Posts
- **Implementação da Rota**: Criamos uma rota "/posts" que retorna todos os posts em formato JSON.
  - **Método GET**: Utilizamos `app.get` para definir a rota e `res.json` para enviar a resposta.
  - **Estrutura da Resposta**: A resposta contém um array de objetos, cada um representando um post.

## 6. Rota para Post Individual
- **Acesso a Post Específico**: Implementamos uma rota que permite acessar um post específico através de seu ID.
  - **Parâmetros na URL**: Utilizamos a sintaxe "/posts/:id" para indicar que o ID do post será um parâmetro na URL.
  - **Função de Busca**: Criamos uma função chamada `buscaPostPorId` que busca o post correspondente no array.
    - **Uso do `findIndex`**: Utilizamos o método `findIndex` do JavaScript para encontrar o índice do post com o ID correspondente.

## 7. Função de Busca
- **Lógica da Função**: A função `buscaPostPorId` recebe um ID e retorna o índice do post que corresponde a esse ID.
  - **Verificação de ID**: A função verifica se o ID do post no array é igual ao ID passado como parâmetro, utilizando `post.id === Number(id)`.

## 8. Conexão com Banco de Dados
- **Importância do Banco de Dados**: Discutimos a necessidade de um banco de dados para armazenar dados de forma persistente, já que os dados em um array são temporários.
- **Escolha do MongoDB**: Introduzimos o MongoDB como a solução escolhida para armazenar nossos dados na nuvem.
  - **MongoDB Atlas**: Utilizaremos o MongoDB Atlas, que é um serviço que oferece um banco de dados MongoDB na nuvem.
  - **Criação de Conta**: Aprendemos a criar uma conta no MongoDB Atlas e a configurar um cluster gratuito (M0 Free).

## 9. Próximos Passos
- **Conexão com o MongoDB**: Na próxima aula, planejamos conectar nossa aplicação ao MongoDB, permitindo que possamos armazenar e recuperar dados de forma mais robusta.
- **Operações com Dados**: Vamos aprender a realizar operações de CRUD (Create, Read, Update, Delete) com os dados armazenados no banco.

## Conclusão
Essa aula foi fundamental para entender como construir uma API básica, a importância de estruturar dados de forma que possam ser facilmente acessados e manipulados, e a introdução ao uso de bancos de dados para persistência de dados.