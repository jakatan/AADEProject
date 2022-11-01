# README

## Introduction ##

This repository contains the website for the American Association of Drilling Engineers.

## Requirements ##

This code has been run and tested on:

* Ruby - 3.0.2p107
* Rails - 6.1.7
* Ruby Gems - Listed in `Gemfile`
* PostgreSQL - 13.3 
* Bootstrap - v4.0


## External Deps  ##

* Docker - Download latest version at https://www.docker.com/products/docker-desktop
* Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
* Git - Downloat latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

## Installation ##

Download this code repository by using git:

 `git clone https://github.com/jakatan/AADEProject.git`


## Tests ##

An RSpec test suite is available and can be ran using:

  `rspec spec/`

## Execute Code ##

Run the following code in Powershell if using windows or the terminal using Linux/Mac

  `cd your_github_here`
  
  MAC:
  `docker run --rm -it --volume "$(pwd):/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`

  Windows Locally:
  `docker run --rm -it --volume "${PWD}:/rails_app" -e DATABASE_USER=test_app -e DATABASE_PASSWORD=test_password -p 3000:3000 dmartinez05/ruby_rails_postgresql:latest`
  
  `cd rails_app`

Install the app

  `bundle install && rails webpacker:install && rails db:create && rails db:migrate`

Run the app
  `rails server --binding=0.0.0.0`

The application can be seen using a browser and navigating to http://localhost:3000/


## Environmental Variables/Files ##

GOOGLE_OAUTH_CLIENT_ID = The client ID for the google project used for authentication

GOOGLE_OAUTH_CLIENT_SECRET = The secret key for the google project used for authentication

## Google Oauth ##

By default the code runs locally without accessing live server for google authentication. 
The mock account used to simulate logging in can be found in: 
[config/environments/development.rb](config/environments/development.rb).
This mocks the act of signing in with the email listed. 

To link a google project add the corresponding environments variables to the docker run command:\
  `-e GOOGLE_OAUTH_CLIENT_ID=<Client-ID> -e GOOGLE_OAUTH_CLIENT_SECRET=<Client Secret>`

## Deployment ##

Follow the Google Doc: https://docs.google.com/document/d/19gs5thecCzYK91M_64VEXag5vNPYi4n59MNq9B8TzpI/edit


## CI/CD ##

N/A

## Support ##

TBA