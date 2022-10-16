# Kittynews 😼

### Task 1

Add Vote/Unvote button to posts.

On the homepage, there is an inactive vote button.

* Click by an unlogged user should redirect to the login page
* Click by a logged in user should create a vote
* Click on an already voted post should remove the vote
* Visually mark which posts the user have voted on
* Use GraphQL for fetching and updating the data

### Task 2

Show post information & comments on post page:

http://localhost:3000/posts/1

* Use GraphQL for fetching and updating the data

### Task 3

*Can't tell you yet* 😸 🙊
* Logged In User can comment on Post.
* Logged In User can reply to Comment.
* Logged In User can vote/Un vote any comment.
* One User can follow another User.

This will be the task during the pair-programming session.

## Criteria:

**Getting to a working solution is most important**.

After that we look for:

- Database design
- Performance
- Dealing with GraphQL N+1
- Tests
- Best practices for Ruby, React, GraphQL

---

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
