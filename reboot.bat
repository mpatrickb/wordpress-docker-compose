@echo off
SET FOLDER=%CD%

docker-compose down
docker volume rm wordpress-docker-compose_db
docker volume rm wordpress-docker-compose_db_data


RMDIR /Q/S "%FOLDER%/wp-app"


docker-compose up -d