<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/84390462-04c73c00-abce-11ea-9a83-8655b3166796.png" alt="Titulo do Projeto"/>
</p>

<p align="center">
  <img src="http://img.shields.io/static/v1?label=Ruby%20On%20Rails%20&message=6.0.2.2&color=red&style=for-the-badge&logo=ruby"/>
  <img src="http://img.shields.io/static/v1?label=REACT&message=FRAMEWORK&color=BLUE&style=for-the-badge&logo=REACT">
  <img src="http://img.shields.io/static/v1?label=HEROKU&message=DEPLOY&color=VIOLET&style=for-the-badge&logo=HEROKU">
</p>

<p align="center">
  <img src="https://img.shields.io/apm/l/vim-mode?color=green&label=license&logo=license&logoColor=green&style=for-the-badge"/>
  <img src="http://img.shields.io/static/v1?label=TDD&message=FRONTEND%20AND%20BACKEND&color=GREEN&style=for-the-badge&logo=CHECK">
  <img src="http://img.shields.io/static/v1?label=STATUS&message=IN%20PROGRESSS&color=ORANGE&style=for-the-badge">
</p>

## List of Content

:small_orange_diamond: [Description of Project](#description-of-project)

:small_orange_diamond: [Functionalites](#Functionalites)

:small_orange_diamond: [Installed Gems](#installed-gems)

:small_orange_diamond: [Requirements](#requirements-package)

:small_orange_diamond: [Settings](#settings)

:small_orange_diamond: [Run application](#run-application-arrow_forward)

:small_orange_diamond: [Run tests](#run-tests-memo)

:small_orange_diamond: [Database](#database-floppy_disk)

:small_orange_diamond: [Routes](#routes)

:small_orange_diamond: [License](#license-trident)

## Description of Project

<p align="justify">
  The project is a simple TODO List of tasks. 
</p>

## Functionalites

Is possible to do:

:heavy_check_mark: See all tasks 

:heavy_check_mark: Create new tasks

:heavy_check_mark: Edit a task as done or not 

:heavy_check_mark: Delete a task

:heavy_check_mark: Delete all tasks

## Deploy com Heroku 

> https://test-rails-app-to-do.herokuapp.com/

## Techs

:bookmark: Ruby on Rails

:bookmark: React

## Gems instaladas

:books: [**PG**](https://rubygems.org/gems/pg/versions/0.18.4?locale=pt-BR) to use a database Postgresql 

:books: [**Rack Cors**](https://rubygems.org/gems/rack-cors) to define a way for client web applications that are loaded in one domain to interact with resources in a different domain

:books: [**React Rails**](https://rubygems.org/gems/react-rails/versions/1.7.1?locale=pt-BR) to do a integration betwen rails and react

### To test application

:books: [**SimpleCov**](https://github.com/colszowka/simplecov) para  gerar relatórios referentes a cobertura de testes

:books: [**RSpec**](https://github.com/rspec/rspec-rails) para escrever e executar testes unitários, isto é, de baixo nível 

:books: [**Capybara**](https://github.com/teamcapybara/capybara) para escrever e executar testes de integração, isto é, de alto nível

## Requirements :package:

Some resources should be installed before to setting the project

:warning: [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) versão >=2.6.3

:warning: [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) versão >=6.0.2.2

:warning: [Node](https://nodejs.org/en/download/) versão >=10.13.0

:warning: [Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

:warning: [Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

:warning: [Yarn](https://classic.yarnpkg.com/pt-BR/docs/install/#windows-stable) versão >=1.22.4 

To check version, run:
```
$ <name of requirement> -v
```
## Settings

### Start Database
In prompt command, clone this project:
```
$ git clone https://github.com/reginadiana/new_api_task
```
Acess the folder
```
$ cd new_api_task
```
Install the dependencies and prepare the database to **backend**
```
$ bin/setup
```
To setting **frontend**, run:
```
$ cd client
$ yarn install
```

## Run application :arrow_forward:

### Backend
```
$ cd .. # You should be in new_api_task folder
$ rails s -p 3001
```

### Frontend

```
$ cd client
$ yarn -cwd client start or yarn start
```

> Before, acess http://localhost:3000 to see application

:warning: Attention: The React application is request API from path `https://test-rails-app-to-do.herokuapp.com/tasks`. If you want to **change** to same path local, you can change this path in all components as [example](https://github.com/reginadiana/new_api_task/blob/add-license-1/client/src/components/list/index.js):

Change this code:
```javascript

// client/scr/component/list

async checkTask(task) {
    await fetch(`https://test-rails-app-to-do.herokuapp.com/tasks/${task.id}`,
      {
        ...
        },
        ...
      }
     )
```
To

```javascript

// client/scr/component/list

async checkTask(task) {
    await fetch(`https://localhost:3001/tasks/${task.id}`,
      {
        ...
        },
        ...
      }
     )
```

## Run tests :memo:

### Backend 
```
$ cd new_api_task
$ rspec or bundle exec rspec
```

### Frontend
```
comming soon
```

## Database :floppy_disk:

The database used was [PostgreSQL](https://guides.rubyonrails.org/active_record_postgresql.html). He can be setting with command 
``` bin/setup```. To **restart** data, use the command ```rails db:reset```. 

JSON with data default:

> https://test-rails-app-to-do.herokuapp.com/tasks

## Rotes

To se the routes of application, run:

```
$ rails routes -g tasks
```

## License :trident:

The [MIT License](https://github.com/reginadiana/new_api_task/tree/add-license-1) (MIT)

Copyright :copyright: 2020 Task Finisher
<br/>
<img src="https://badges.frapsoft.com/os/v1/open-source.svg?v=102"/>
