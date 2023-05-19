#!/bin/bash                                                                                                                                                                     

cd /home/norm/Docker

for dir in */; do 
  cd "$dir"
  docker-compose pull
  docker-compose up -d
  docker-compose ps
  cd /home/norm/Docker
done