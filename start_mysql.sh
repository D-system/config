# docker stop mysql_5.7
# docker run -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=true -e MYSQL_DATABASE=circle_test -e MYSQL_HOST=127.0.0.1 -e MYSQL_USER=root --shm-size 2G --name mysql_5.7 circleci/mysql:5.7-ram
docker restart mysql_5.7