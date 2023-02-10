# Realtime Search with Analytics

## Requirements

- Ruby on Rails
- PostgreSQL

## Setup

- clone the repo
- `bundle install`
- `rake db:create`
- `rake db:migrate`

## Run
- `bin/dev` to start the server

## Test
Testing is done with rspec for request and models
- `rspec` to run the tests

## Seeds
If you intend to start with some data, you can run `rake db:seed` to create some data. In the seed file you can change the number of records to be created, and also find the details of the admin user created.

Login with the admin user to see analytics.