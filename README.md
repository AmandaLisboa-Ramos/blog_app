# Blog App

Um projeto de blog desenvolvido com Ruby on Rails, utilizando ActiveStorage para upload de arquivos, autenticação de usuários e Sidekiq para processamento assíncrono. Este projeto permite que usuários autenticados criem publicações com upload de arquivos e gerenciem suas postagens.

## Índice
- [Tecnologias Utilizadas](#Tecnologias-Utilizadas)
- [Funcionalidades Principais](#Funcionalidades-Principais)
- [Requisitos de Sistema](#Requisitos-de-Sistema)
- [Configuração e Execução do Projeto](#Configuração-e-Execução-do-Projeto)
- [Como Usar](#Como-Usar)
- [Credenciais de Acesso para Testes](#Credenciais-de-Acesso-para-Teste)
- [Recuperação de Senha](#Recuperação-de-Senha)
- [Estrutura do Projeto](#Estrutura-do-Projeto)
- [Considerações Finais](#Considerações-Finais)

## Tecnologias Utilizadas

- **Ruby on Rails**: Framework web utilizado para desenvolvimento.
- **PostgreSQL**: Banco de dados relacional.
- **Redis**: Utilizado para gerenciar filas de tarefas no Sidekiq.
- **Sidekiq**: Processamento assíncrono de tarefas.
- **ActiveStorage**: Gerenciamento de upload e armazenamento de arquivos.
- **Bootstrap**: Framework CSS para estilização e layout responsivo.
- **Mailgun**: Serviço de envio de e-mails.
- **Heroku**: Hospedagem da aplicação.

## Funcionalidades Principais

### Área Deslogada
- **Visualizar Posts Públicos**: Usuários não autenticados podem ver os posts publicados por todos os usuários, ordenados do mais novo para o mais antigo.
- **Paginação de Posts**: Quando houver mais de 3 posts, os posts são divididos em páginas, com cada página exibindo até 3 posts. O 4º post será movido para a página 2, e assim por diante.
- **Comentários Anônimos**: Usuários não autenticados podem fazer comentários nos posts de forma anônima.
- **Cadastro de Novo Usuário**: Usuários podem se cadastrar na aplicação.
- **Login de Usuário**: Usuários podem fazer login com um usuário cadastrado.

### Área Logada
- **Criação de Postagens**: Usuários autenticados podem redigir e publicar posts.
- **Edição e Exclusão de Postagens**: Usuários autenticados podem editar e apagar posts que publicaram.
- **Comentários Identificados**: Usuários autenticados podem fazer comentários identificados ou anônimos.
- **Edição de Cadastro**: Usuários autenticados podem editar suas informações de cadastro.
- **Alteração de Senha**: Usuários autenticados podem alterar a senha de sua conta.
- **Anexar Arquivos .txt**: Usuários autenticados podem anexar arquivos do tipo `.txt` às suas postagens.
- **Tags nos Posts**: Usuários podem adicionar tags aos seus posts, para facilitar a categorização e busca.


## Requisitos de Sistema

- **Ruby**: Versão 3.0 ou superior.
- **Rails**: Versão 7.0 ou superior.
- **PostgreSQL**: Versão 12 ou superior.
- **Redis**: Versão 6 ou superior.
- **Node.js e Yarn**: Para gerenciar dependências frontend.

## Configuração e Execução do Projeto

### Passo 1: Clone o Repositório

```bash
$ git clone https://github.com/AmandaLisboa-Ramos/blog_app.git
$ cd blog_app
```
### Passo 2: Instale as Dependências
- Instale as dependências do Ruby:

```bash
$ bundle install
```
- Instalar as dependências do JavaScript:

```bash
$ yarn install
```

### Passo 3: Configure o Banco de Dados
- Crie o banco de dados e rode as migrações:

```bash
$ rails db:create db:migrate
```

### Passo 4: Inicie o Redis
- Certifique-se de que o Redis está rodando:

```bash
$ redis-server
```

### Passo 5: Inicie o Sidekiq
- Inicie o processador de tarefas Sidekiq:

```bash
$ bundle exec sidekiq
```

### Passo 6: Inicie o Servidor Rails
- Inicie o servidor da aplicação:

```bash
$ rails server
```
Acesse a aplicação em: http://localhost:3000

## Como Usar

- Cadastre-se ou faça login na aplicação.
- Crie uma nova postagem e, se desejar, anexe um arquivo no formato .txt.
- Visualize as postagens e faça o download de arquivos anexados.

## Credenciais de Acesso para Teste

Caso você não queira usar seu próprio e-mail para criar uma conta, utilize as credenciais abaixo para acessar o sistema e realizar publicações:

- **E-mail**: teste@teste.com
- **Senha**: teste123

## Recuperação de Senha

Caso você precise recuperar sua senha, envie para o endereço eletrônico [amandalisboa.am@gmail.com](mailto:amandalisboa.am@gmail.com) o endereço de e-mail que deseja utilizar para receber as instruções de recuperação. Em seguida, entraremos em contato para configurar o envio via Mailgun.

## Estrutura do Projeto

- **app/controllers**: Controladores que gerenciam a lógica do sistema.
- **app/models**: Modelos que representam as entidades do banco de dados.
- **app/views**: Templates para renderização de páginas HTML.
- **app/javascript**: Código JavaScript e assets do frontend.
- **config**: Configurações da aplicação.


## Considerações Finais

Muito obrigado por explorar o **Blog App**! Fico feliz em compartilhar esse projeto com você. Se você tiver alguma dúvida, sugestão ou feedback, não hesite em me enviar uma mensagem.

- **E-mail**: amandalisboa.am@gmail.com

Aproveite a aplicação e até a próxima!
