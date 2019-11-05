#!/bin/sh

docker network create mindsers.dev

cd $HOME/Developer/data/mysql && docker-compose up -d

cd $HOME/Developer/env/wordpress && docker-compose up -d
