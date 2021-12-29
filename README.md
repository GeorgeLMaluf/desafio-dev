# Desafio-dev
This project is a solution to implement a set of features to solve the questions describe in [CHALLENGE.md](CHALLENGE.md) file.

## Requirements
Any operating system with docker and docker-compose tool installed.

## Setup

### Build containers
The fist step to setup this project, you need build the api and web containers. To do that use the follow command:
```
$ docker-composer build
```

### Start/Stop RDBMS (PostgreSQL)
After build the web and api containers, you need startup and shutdown the PostgreSQL server to build the data volume.
To start postgresSQL container type the command:
```
$ docker-compose up -d postgres
```

After finish this process, stop the database server using this:
```
$ docker-compose down
```

### Setup Api Databases
The next step is create the database used to store the data imported / read by api to web page applicaton. 
Type this command:
```
$ docker-compose run api bundle exec rake db:create db:migrate
```

## Running the project
To run the project execute the follow:
```
$ docker-compose up -d
```

After that, open your favorite browser using the address:
```
http://localhost:3000/
```

Enjoy.
## Executing the test suite

To run the api test suite, use the follow:
```
$ docker-compose run api bundle exec rspec
```

### ATENTION
At first time, you need create the database for test proposes. To do that, you need run the bash on api container and setup the test database.
To run the bash on api container, execute:
```
$ docker-compose run api bash
```
Inside on container, type the follow command:
```
# RAILS_ENV=test bundle exec rake db:create db:migrate
```
Exit of container:
```
# exit
```

