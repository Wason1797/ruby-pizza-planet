<h1 align="center"> Ruby Pizza Planet </h1>

![ruby-badge](https://img.shields.io/badge/ruby-%252314354C.svg?style=for-the-badge&logo=ruby&logoColor=white)

This is an example software for a pizzeria that takes customizable orders.

## Table of Contents

- [Getting started](#getting-started)
- [Running the backend project](#running-the-backend-project)
- [Running the frontend](#running-the-frontend)
- [Testing the backend](#testing-the-backend)

## Getting started

You will need the following general tools:

- Ruby Installed. [3.1.2](https://www.ruby-lang.org/en/documentation/installation/).

- A text editor: preferably [Visual Studio Code](https://code.visualstudio.com/download)

- Extensions such as [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)

## Running the backend project

- Clone the repo

```bash
git clone 
```

- Install all necesary dependencies

```bash
bundle install
```

- Start the database (Only needed for the first run):

```bash
rails db:migrate
```

- Run the project with:

```bash
rails s
```

## Running the frontend

- Clone git UI submodule

```bash
git submodule update --init
```

- Install Live Server extension if you don't have it from [here](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer) on VSCode Quick Open (`Ctrl + P`)

```bash
ext install ritwickdey.LiveServer
```

- To run the frontend, start `ui/index.html` file with Live Server (Right click `Open with Live Server`)

- **Important Note** You have to open vscode in the root folder of the project.

- **To avoid CORS errors** start the backend before the frontend, some browsers have CORS issues otherwise

### Testing the backend

- Run the test command

```bash
rails t
```
