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
    mongodb,
    google-gemini,
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

# Resumo Detalhado da Aula 3 da Imersão Dev Back-End

Na terceira aula da Imersão Dev com Google Gemini, os alunos aprenderam a conectar sua aplicação a um banco de dados MongoDB na nuvem. O conteúdo abordou a instalação do driver MongoDB, a criação de uma base de dados e coleções no MongoDB Atlas, e a importância de usar variáveis de ambiente para proteger informações sensíveis, como a string de conexão.Conexão com o MongoDB

Os alunos aprenderam a conectar sua aplicação Node.js ao MongoDB utilizando o MongoDB Atlas, que é uma solução de banco de dados na nuvem. O primeiro passo foi instalar o driver MongoDB. Esse driver é essencial para que a aplicação consiga se comunicar com o banco de dados. Após a instalação, os alunos foram guiados na criação de uma base de dados chamada "imersao-instabytes" e uma coleção chamada "posts" no MongoDB Atlas.Criando a Base de Dados e Coleção

Os alunos acessaram o MongoDB Atlas, criaram uma conta e acessaram o painel de controle. No painel, foi criada uma base de dados chamada "imersao-instabytes" e, dentro dela, uma coleção chamada "posts", onde os dados dos posts seriam armazenados.Variáveis de Ambiente

Um ponto crucial discutido foi a segurança das informações sensíveis, como a string de conexão do banco de dados. Para isso, foi ensinado como criar um arquivo ".env", onde as variáveis de ambiente são armazenadas. A string de conexão foi salva nesse arquivo, e o uso de variáveis de ambiente ajuda a evitar que informações sensíveis sejam expostas no código-fonte, especialmente ao usar sistemas de controle de versão como o Git.Modularização do Código

A aula também enfatizou a importância da modularização do código. Os alunos aprenderam a separar diferentes responsabilidades em arquivos distintos, o que é uma prática comum em desenvolvimento de software. A estrutura sugerida incluiu rotas, onde as rotas da aplicação são definidas; controladores, onde a lógica de manipulação das requisições e respostas é implementada; e modelos, onde a lógica de conexão com o banco de dados e as operações de CRUD (Create, Read, Update, Delete) são definidas.Estrutura de Pastas Sugerida

Os alunos foram incentivados a criar uma estrutura de pastas organizada, como "src" para o código-fonte, com subpastas para "config", "controllers", "models" e "routes".Funções Assíncronas

Os alunos também aprenderam sobre funções assíncronas e como usar "async" e "await" para lidar com operações que podem levar algum tempo, como a conexão com o banco de dados ou a busca de dados. O uso dessas palavras-chave permite que o código continue a ser executado sem bloquear a aplicação enquanto aguarda a conclusão de uma operação.Implementação da Função "getTodosPosts"

Uma das implementações mais importantes foi a criação da função "getTodosPosts", que se conecta ao banco de dados e retorna todos os posts. Essa função foi chamada dentro da rota correspondente, permitindo que a aplicação respondesse a requisições GET na rota "/posts" com os dados armazenados no MongoDB.Testes e Validação

Ao final da aula, os alunos foram capazes de testar a aplicação acessando a rota "/posts" no navegador, onde puderam visualizar os dados que haviam sido inseridos anteriormente no MongoDB. Isso demonstrou a eficácia da conexão e a modularização do código, além de validar que a aplicação estava funcionando como esperado.Conclusão

A terceira aula foi um marco importante na jornada dos alunos, pois não apenas introduziu conceitos fundamentais de back-end, mas também preparou o terreno para as próximas aulas, onde continuarão a expandir suas aplicações e a manipular dados no banco de dados. A ênfase na organização do código e nas boas práticas de programação é essencial para o desenvolvimento de software sustentável e escalável.

# Resumo Detalhado da Aula 4 da Imersão Dev Back-End

Na aula 4 da Imersão Dev Back-End, os instrutores Guilherme Lima, Juliana Amoasei e André David conduziram os alunos por um processo interessante de envio de dados para uma base de dados, focando na criação de posts e no gerenciamento de imagens.Principais Tópicos Abordados:

Verbos HTTP: 
Os alunos aprenderam sobre os quatro principais verbos HTTP: GET (para buscar dados), POST (para criar novos dados), PUT (para atualizar dados) e DELETE (para remover dados). O foco da aula foi no verbo POST, que é utilizado para enviar informações para o servidor.

Estrutura do Projeto:
A estrutura do projeto foi revisada, com pastas específicas para configuração do banco de dados, modelos, rotas e controladores. O controlador foi descrito como a "cola" que conecta as rotas com os dados.

Criação de Rota para POST:
Os alunos criaram uma nova rota para enviar dados, especificamente para criar um novo post. A rota foi definida como /posts e o método utilizado foi o app.post.

Manipulação de Requisições:
Foi discutido como manipular o corpo da requisição (req.body) para extrair os dados que seriam enviados ao banco. Os alunos aprenderam a usar try e catch para tratar exceções e garantir que o sistema não travasse em caso de erro.

Interação com o Banco de Dados:
A função criarPost foi implementada no modelo para inserir novos posts no banco de dados MongoDB. Os alunos aprenderam a usar o método insertOne para adicionar novos registros.

Upload de Imagens:
A aula também abordou como enviar imagens para o servidor. Os instrutores introduziram o Multer, uma biblioteca que facilita o upload de arquivos. Os alunos aprenderam a configurar o Multer para armazenar imagens em uma pasta específica (./uploads).

Renomeação de Arquivos:
Após o upload, os alunos aprenderam a renomear os arquivos de imagem com o ID gerado pelo MongoDB, garantindo que cada imagem tivesse um nome único e associado ao seu respectivo post.

Testes com Postman:
Para testar as funcionalidades implementadas, os alunos foram orientados a usar o Postman para enviar requisições POST e verificar se os dados e as imagens estavam sendo corretamente armazenados no banco de dados e na pasta de uploads.

Próximos Passos:
A aula terminou com uma prévia do que seria abordado na próxima aula, onde os alunos aprenderiam a associar as imagens armazenadas no servidor com a nuvem, utilizando soluções da Google.

Conclusão:
A aula 4 foi rica em conteúdo prático e teórico, proporcionando aos alunos uma compreensão sólida sobre como enviar dados e gerenciar arquivos em um ambiente de back-end. Os conceitos de verbos HTTP, manipulação de requisições e o uso do Multer foram fundamentais para o desenvolvimento do projeto.

# Resumo Detalhado da Aula 5 da Imersão Dev Back-End

1. Recapitulando o Projeto:A aula começa com uma revisão do progresso do projeto, que envolve a lógica de upload de imagens. Cada imagem agora está vinculada a um ID único no banco de dados MongoDB, o que facilita a identificação e manipulação dos dados.

2. Atualizando o Registro Existente:Um dos principais objetivos é atualizar um registro existente em vez de criar um novo. Para isso, um novo método HTTP PUT é implementado, juntamente com uma nova rota /upload/:id. Essa rota permite que os usuários atualizem informações de um post específico.

3. Tornando a Pasta 'uploads' Acessível:A pasta onde as imagens são armazenadas é tornada publicamente acessível. Isso significa que as imagens podem ser acessadas via URL, o que é essencial para a funcionalidade do projeto.

4. Construindo a URL da Imagem:A URL da imagem é construída dinamicamente usando o ID do post, o que permite que cada imagem tenha um link único e acessível.

5. Atualizando o Post:A função atualizarNovoPost é criada no controller para lidar com a requisição PUT. Essa função recebe o ID do post e os dados atualizados (como descrição e texto alternativo). Um objeto postAtualizado é então construído com esses dados e a URL da imagem.

6. Atualizando o Banco de Dados:No modelo postsModel.js, a função atualizarPost é criada utilizando o método updateOne do MongoDB. Essa função recebe o ID e o objeto postAtualizado, realizando a atualização no banco de dados.

7. Integrando com o Google Gemini:Para gerar descrições automaticamente para as imagens, a API do Google Gemini é integrada ao projeto. Um novo serviço, geminiService.js, é criado na pasta de serviços, contendo o código necessário para interagir com o Gemini.

8. Configurando a Chave da API:A chave da API do Gemini é armazenada na variável de ambiente GEMINI_API_KEY, que é configurada no arquivo .env. Isso garante que a chave não fique exposta no código.

9. Gerando Descrições com Gemini:A função gerarDescriçãoComGemini é criada para receber o buffer da imagem e retornar a descrição gerada pelo Gemini. Essa descrição é então incluída no objeto postAtualizado antes de ser enviada para o banco de dados.

10. Testando a Integração:Após instalar a dependência @google/generative-ai, o servidor é reiniciado. O processo de upload e atualização é testado usando o Postman. Um GET subsequente é realizado para confirmar que a descrição gerada pelo Gemini foi salva corretamente no banco de dados.

11. Integrando com o Front-End:Um projeto front-end pré-configurado, chamado "insta-like", é utilizado para consumir a API. Para permitir a comunicação entre o front-end (que roda na porta 8000) e o back-end (na porta 3000), o pacote cors é instalado e configurado no back-end.
  
12. Configurando a URL da API:A URL da API do back-end é definida na variável de ambiente API_URL no arquivo .env do projeto front-end. Após instalar as dependências do front-end com npm install, o projeto é executado e exibe os dados do back-end, incluindo as imagens e as descrições geradas pelo Gemini.

13. Publicando na Google Cloud:Para preparar o projeto para o deploy na Google Cloud, o pacote dotenv é instalado e configurado para garantir o acesso às variáveis de ambiente. As variáveis no arquivo .env são colocadas entre aspas duplas para evitar problemas durante o deploy.

14. Realizando o Deploy:O arquivo .gitignore é removido para garantir que o arquivo .env seja incluído no deploy. As dependências do projeto são instaladas na Cloud Shell com npm install. O deploy é feito usando o serviço Cloud Run da Google Cloud, utilizando o comando gcloud run deploy, especificando a origem do código, a porta e permitindo acesso público à API.

15. Acesso à API na Nuvem:Após o deploy, a URL do serviço é fornecida, permitindo o acesso à API na nuvem. Isso finaliza a configuração e publicação do projeto.

16. Informações Adicionais: Um script chamado services.sh é utilizado para automatizar a configuração dos serviços na Google Cloud. Isso simplifica o processo de configuração, permitindo que os desenvolvedores se concentrem mais na lógica do aplicativo e menos na configuração da infraestrutura.

17. Vouchers da Google Cloud
Os participantes da imersão receberam vouchers da Google Cloud. Esses vouchers são uma forma de facilitar o acesso aos serviços da Google Cloud, evitando a necessidade de configurar um cartão de crédito. Isso é especialmente útil para aqueles que estão apenas começando a explorar a nuvem e desejam experimentar os serviços sem custos iniciais.

18. Instruções para Resgatar o Voucher
Instruções detalhadas sobre como resgatar o voucher e configurar o projeto na Google Cloud foram disponibilizadas no Guia de Mergulho e também enviadas por e-mail. Essas instruções são essenciais para garantir que todos os participantes possam aproveitar ao máximo os recursos oferecidos pela Google Cloud.

19. Certificado de Conclusão
Os participantes que assistiram a todas as aulas da imersão têm a oportunidade de solicitar um certificado de conclusão. Esse certificado é uma forma de reconhecimento pelo esforço e aprendizado durante a imersão, além de ser um bom complemento para o currículo dos participantes.

20. Conclusão da Aula
A aula 5 finaliza com uma recapitulação dos principais conceitos abordados, reforçando a importância da integração entre o back-end e o Google Gemini, bem como a publicação do projeto na Google Cloud. Os instrutores incentivam os alunos a praticarem o que aprenderam e a explorarem mais sobre as tecnologias discutidas.
