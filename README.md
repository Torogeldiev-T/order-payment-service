# Order Payment Service

This project was developed as test task

## About The Project
Simple web application that emulates payment through Sberbank API.
There is no real connection to the API, tests are covering payment service

Rake task creates order with random client data that can be viewed and paid

## Installation and Run
```bash
git clone https://github.com/Torogeldiev-T/order-payment-service.git
cd order-payment-service
bundle install
rails db:setup
bin/dev
```
## Run tests
```bash
bundle exec rspec
```
## Run rake task to create order
Rake task can be called from console through
```bash
rake create_order
```

Or throuh application itself
