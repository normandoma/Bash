#!/bin/bash                                                                                                                                                                     

cd /home/normando/Docker

for dir in */; do 
  cd "$dir"
  docker-compose pull
  docker-compose up -d
  docker-compose ps
  cd /home/normando/Docker
done