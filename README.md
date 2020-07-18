# Synka.app - handle day to day customer contact via SMS.

## Getting started
The application is written in Ruby on Rails, download the repository and get started!

- Install `Ruby 2.7.1` ([rbenv](https://github.com/rbenv/rbenv#groom-your-apps-ruby-environment-with-rbenv))
- Install [`Postgres`](https://www.postgresql.org/download/)
- Install [`yarn`](https://yarnpkg.com/en/docs/install)
- Install [`bundler`](https://bundler.io)
- Run `bin/setup` inside this repository.

### Install SSL for localhost
https://github.com/FiloSottile/mkcert
```
brew install mkcert
mkcert -install
cd config/ssl
mkcert example.com "*.example.com" example.test localhost 127.0.0.1 ::1
mv example.com+5-key.pem example-key.pem
mv example.com+5.pem example.pem
```

Application should be available at `https://localhost:8443`.

### Webpack

If editing a lot of javascript code which needs to be recompiled, start the `webpack-dev-server` separately.
In a terminal separate from `rails s`:
```
./bin/webpack-dev-server
```

### Start the server

```bash
foreman start -f Procfile.dev
```

### Create user
- Run `rails console`
- In the console, input:
```ruby
User.create!(email: 'youremail@mail.com', role: :admin, password: 'your-new-password', name: 'You!')
```

## Status
[![CircleCI](https://circleci.com/gh/davidwessman/synka/tree/master.svg?style=shield)](https://circleci.com/gh/davidwessman/synka/tree/master)
