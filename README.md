# watt_project

docker-compose up --buld

docker-compose up -d

export MYSQL_DATABASE="acm_db"
export MYSQL_USER="acmandi"
export MYSQL_PASSWORD="acmandi123"
export MYSQL_HOST="localhost"
export MYSQL_PORT="3306"

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'teeza123';

CREATE USER 'acmandi'@'localhost' IDENTIFIED BY 'acmandi123';

create database acm_db;

GRANT ALL PRIVILEGES ON acm_db.* TO 'acmandi'@'localhost';
FLUSH PRIVILEGES;
sudo apt install libmysqlclient-dev python-dev

scp -r accwatts watt_project/acwatts_frontend/dist/* root@165.22.210.104:/var/www/acwatts/html

scp -r accwatts acm_db_bckp.sql root@165.22.210.104:/home/playground

git pull
systemctl restart gunicorn.service
systemctl restart gunicorn.socket
sudo systemctl restart nginx
