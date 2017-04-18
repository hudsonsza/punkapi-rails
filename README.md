# PUNK API

Simple Rails Version using best development practices.

# TODO

* ~~Utilizar como exemplo a seguinte API: https://punkapi.com/documentation/v2~~
* ~~Criar três ou mais Models~~
**Beers, FoodParing**
* ~~Ter uma associação entre Models do tipo 1..n~~
* ~~Ter uma associação entre Models do tipo n..n~~
* ~~A aplicação deve ser Rails API-only~~
* ~~Elaborar documento de especificação das chamadas ao WebService~~
**README e Swagger**
* ~~Seguir os padrões e convenções do Ruby on Rails~~
**Rubocop and Ruby Styles**
* ~~Seguir o padrão RESTful~~
**Foi usado GET/POST/PUT/DELETE com os códigos correspondentes 200, 204, ...**
* ~~Seguir Normalização do Banco de Dados~~
* ~~Implementar Testes Unitários e Funcionais~~
**Usado RSpec, SimpleCov (100%)**
* ~~Utilizar o Ruby on Rails 5 ou superior~~
* ~~Utilizar Ruby 2.3.3 ou superior~~
* ~~Utilizar o RVM ou outra ferramenta para gerenciamento de versões Ruby~~
**Usado docker-compose e criado tasks com o Makefile**
* ~~Enviar o código para um repositório git público (github, Bitbucket, Gitlab)~~
---
* ~~Utilizar Swagger ou outra ferramenta para documentação da API~~
* Criar uma aplicação web separada em Ruby on Rails que consuma o Web Service criado
* ~~Implementar testes com RSpec e/ou Cucumber~~
* ~~Utilizar FactoryGirl ao invés de fixtures~~
---
* ~~Utilizando RubyStyle com RuboCop~~
* ~~Banco de dados NoSQL como MongoDB~~
* ~~Makefile para automatização de tarefas de desenvolvimento~~
* ~~Utilizar .env para facilitar o gerenciamento de environments~~
* ~~Aplicação compativel com Twelve-Factor App~~
* ~~Utilizar docker-compose with redis, mongo e aplicação.~~

# Quickstart

Using for build application with Docker and execute db:seed for imported data from punkapi using for testing on API

```bash
make build
make run
```

Now access http://localhost:9292

# Rebuild

```bash
make rebuild
```

# Testing and RubyStyle

```bash
make rubocop
make test
```

# Simple documentation

## Get Beers

Gets beers from the api, you can apply several filters using url paramaters, the available options are listed below.

```bash
$ curl https://localhost:9292/v1/beers
```

## Get Random Beer

Gets a random beer from the API, this takes no paramaters.

```bash
$ curl https://localhost:9292/v1/beers/random
```

## Example Response

All beer endpoints return a json array with a number of beer objects inside.

```json
[
    {
        "_id": {
            "$oid": "58f5cc9ecb2b5501fe7c20c2"
        },
        "created_at": "2017-04-18T08:21:50.907Z",
        "description": "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.",
        "image_url": null,
        "name": "Buzz",
        "updated_at": "2017-04-18T08:37:25.296Z",
        "id": "58f5cc9ecb2b5501fe7c20c2"
    }
]
```

# Best practices and technologies

## Using The [Twelve-Factor App](https://12factor.net/)

In the modern era, software is commonly delivered as a service: called web apps, or software-as-a-service. The twelve-factor app is a methodology for building software-as-a-service apps

## Makefile

Makefiles are a simple way to organize code compilation. 

## Docker with Docker Compose

Docker can be installed either on your computer for building applications or on servers for running them.

## EditorConfig

EditorConfig helps developers define and maintain consistent coding styles between different editors and IDEs. The EditorConfig project consists of a file format for defining coding styles and a collection of text editor plugins that enable editors to read the file format and adhere to defined styles. EditorConfig files are easily readable and they work nicely with version control systems.

## dotenv

Shim to load environment variables from `.env` into `ENV` in *development*.

Storing [configuration in the environment](http://12factor.net/config) is one of the tenets of a [twelve-factor app](http://12factor.net). Anything that is likely to change between deployment environments–such as resource handles for databases or credentials for external services–should be extracted from the code into environment variables.

But it is not always practical to set environment variables on development machines or continuous integration servers where multiple projects are run. dotenv loads variables from a `.env` file into `ENV` when the environment is bootstrapped.

## SimpleCov

SimpleCov is a code coverage analysis tool for Ruby. It uses Ruby's built-in Coverage library to gather code coverage data, but makes processing its results much easier by providing a clean API to filter, group, merge, format, and display those results, giving you a complete code coverage suite that can be set up with just a couple lines of code.

## RubyCop

RuboCop is a Ruby static code analyzer. Out of the box it will enforce many of the guidelines outlined in the community Ruby Style Guide./