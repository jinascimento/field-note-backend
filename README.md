
# Necessidade a ser resolvida
Desafio:

Usuários Desenvolver um "CRUD" simples de usuários via Web. Cada usuário possui e-mail e senha. Desenvolver um endpoint/API para validação de e-mail/senha de usuários.

Anotações de Campo Uma Anotação de Campo é composta por:

• Texto Longo

• Usuário

• Data/Hora

• Latitude

• Longitude

Desenvolver uma listagem simples dos registros de Anotações de Campo.

Desenvolver um endpoint/API para receber e salvar registros de Anotações de Campo dos usuários do aplicativo.

Observações:

- Pode usar qualquer sistema de persistência/banco de dados.

- Não precisa criar sistema de autenticação para acessar a interface web.

- As interfaces visuais podem ser bem simples, nosso foco será no design e implementação do backend.

# Especificação técnica

1 - Gestão de usuários

Foi desenvolvido um front-end simples e pratico para realizar a gestão referente a usuários:

* Listagem dos usuários cadastrados

* Cadastro de usuário

* Edição de usuário

* Exclusão usuário

2 - Autenticação

Visando que será utilizado da api para autenticação de usuários via aplicativo foi escolhido a tecnologia Json Web Token.
Sua facilidade em autenticar varios clientes e não ter a complexidade de armazenar tokens no banco de dados.

3 - Anotações de Campo

Foi disponibilizado endpoints para listar todas as anotações por usuário, cadastro de anotações avulsas e cadastro de anotações em lote.
O cadastro de anotações em lote foi implementado para a necessidade de sincronização dos usuários com todas suas anotações marcadas e não enviadas para a api por motivos de conectividade e afins.

## Configuraçes do ambiente

* Ruby version: 2.6.0

* Rails version: 5.2.3

* Banco de dados: PostgreSql

## Ambiente de Desenvolvimento
* Clone este repositorio
* Rode os comandos para configuração do ambiente Rails.

 `bundle install`

`rails db:setup`

* Suba o servidor rails rodando o comando  
  - `rails s`
* Testes unitários: 
  - `rspec`
* O Projeto estara disponivel em 
  - `http://localhost:3000`


### Com docker
* Instale docker: versão 19.03.1
     - Mac: 
        https://docs.docker.com/docker-for-mac/install/
     - Linux:
        https://docs.docker.com/install/linux/docker-ce/ubuntu/
     - Windows:
        https://docs.docker.com/docker-for-windows/install/

* Instale docker-compose: versão 1.24.1
    - Mac: 
        (Instalado junto com o docker Desktop)
     - Linux:
        https://docs.docker.com/compose/install/
     - Windows:
        https://docs.docker.com/compose/install/

* Clone este repositorio
* Acesse a pasta e suba o projeto com o comando `docker-compose up`
* Setup database 
 - `docker-compose run web rails db:setup`
* Testes unitários:
 - `docker-compose run web rspec`
* O Projeto estara disponivel em `http://localhost:3000`

### Cobertura de testes:
![image](https://user-images.githubusercontent.com/25302676/62994251-4d3c8e80-be31-11e9-9b01-a3a189e0bc8e.png)




