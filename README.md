# Kittynews 😼

## Requirements

- PostgreSQL 9.6
- Ruby 2.7.5
- bundler
- yarn
- Docker and docker-compose

## Setup

Install the app dependencies:

```
gem install bundler
brew install yarn

bin/setup
```

Start PostgreSQL via Docker *(and keep in background)*

```
docker-compose up -d
```

Setup the database:

```
bundle exec rails db:create db:migrate db:seed db:test:prepare
```

Start the server:

```
bundle exec rails server
```

## Tests

To run all tests:

```
bundle exec rspec
```

## Running the app

Open the app:

```
http://localhost:3000
```

Sign in as:

* email: `bob@example.com`
* password: `password`

## GraphiQL

[GraphiQL](https://www.npmjs.com/package/graphiql) is installed and can be accessed via:

```
http://localhost:3000/graphiql
```
