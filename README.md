# bee-there

This project is a monorepo containing a Rails API and a Vue.js frontend.

## How to run it locally

### Prerequisites

1. Have Docker (https://docs.docker.com/engine/install/)
2. Ruby (version used is 3.3.0)
3. NodeJS

### 1. Run the API

Firstly, run the PostgreSQL containers used for testing and development :

```sh
cd api/integration
docker compose up
```

Then, in a new terminal, install the gems, run the migrations and start the server :
```sh
cd api
bundle install
bundle exec rails db:migrate
bundle exec rails server
```

The server is now started, you can now [use the API using Swagger](http://127.0.0.1:3000/api-docs/index.html).

#### Run the test suite

```sh
bundle exec rake spec
```

### 2. Run the frontend

Make sure the server is up and running (see above).

Setup the project and run it in dev mode :

```sh
npm install
npm run dev
```
