# docker restart postgres_10.5
# docker run -p 5432:5432 -e POSTGRES_PASSWORD=pass -e POSTGRES_USER=postgres --shm-size 2G --name postgres_10.5 circleci/postgres:10.5-alpine-postgis-ram
# docker stop postgres_10.5
docker restart postgres_10.5
