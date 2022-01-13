FROM ruby:3.1.0-buster

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app

COPY . .
