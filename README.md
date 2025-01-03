# Blog App - Desafio Estágio Backend

Este repositório contém o código-fonte de um aplicativo web desenvolvido como parte de um desafio de seleção para um estágio de backend. O projeto consiste em um sistema de blog com funcionalidades completas de autenticação, postagens e comentários.

## Funcionalidades

### Área Deslogada
- Visualização de posts publicados por todos os usuários, ordenados do mais novo para o mais antigo.
- Paginação a cada 3 posts por página.
- Possibilidade de fazer comentários anônimos.
- Cadastro de novos usuários.
- Login de usuários cadastrados.
- Recuperação de senha via e-mail.

### Área Logada
- Publicação de novos posts.
- Edição e exclusão de posts do usuário logado.
- Possibilidade de fazer comentários identificados.
- Edição do perfil do usuário.
- Alteração de senha.

## Tecnologias Utilizadas

- **Linguagem:** Ruby on Rails
- **Banco de Dados:** PostgreSQL
- **Frontend:** HTML, CSS, Bootstrap
- **Autenticação:** Devise
- **Paginação:** Kaminari
- **Processamento Assíncrono:** Sidekiq
- **Envio de E-mails:** Action Mailer (SMTP - Gmail)

## Configuração do Ambiente de Desenvolvimento

1. Clone o repositório:
   ```bash
   git clone https://github.com/AmandaLisboa-Ramos/blog_app.git
   cd blog_app

