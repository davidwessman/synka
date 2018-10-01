# SyncHours - helps businesses and stores handle their opening-hours online!

## Getting started
The application is written in Ruby on Rails, download the repository and get started!


To ease the installation, we are using [Docker](https://docs.docker.com) and [docker-compose](https://docs.docker.com/compose/) to make things easier.
Make sure these are installed and then run:

- `docker-compose build`
- `docker-compose run web rails db:create db:migrate`
- `docker-compose up`

If not using Docker, run the `bin/setup` script to get started.
It requires [Postgres](https://www.postgresql.org/), [Bundler](http://bundler.io/) and [yarn](https://yarnpkg.com/lang/en/).
## Status
[![CircleCI](https://circleci.com/gh/davidwessman/sync-hours/tree/master.svg?style=shield)](https://circleci.com/gh/davidwessman/sync-hours/tree/master)
