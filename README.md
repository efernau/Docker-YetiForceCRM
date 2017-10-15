
# YetiforceCRM 4.2.0 Docker
[![](https://images.microbadger.com/badges/version/efero/yetiforcecrm.svg)](https://microbadger.com/images/efero/yetiforcecrm "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/efero/yetiforcecrm.svg)](https://microbadger.com/images/efero/yetiforcecrm "Get your own image badge on microbadger.com")


A Docker Compose environment which runs [YetiforceCRM](https://github.com/YetiForceCompany/YetiForceCRM/) in one container (php:7.1-apache)and a MySQL instance in another.	


We make reasonable efforts to support our work. Submit a GitHub [issue](https://github.com/efernau/Docker-YetiForceCRM/issues) if you have a security or other general question about this Docker image.

### Running with Docker Compose

1. Install [Docker and Docker Compose](https://docs.docker.com/compose/install/)
2. Run `docker-compose up -d` from the root of this project.
3. Access `http://{docker_host}:8000` from your web browser to finish setting up YetiforceCRM.

### Running with Docker Run

If you already have MySQL installed or want to use a platform service like Amazon RDS, you can run the YetiforceCRM container seperately using Docker run. To set up YetiforceCRM using this approach, please do the following:

1. Install [Docker](http://docs.docker.com/installation/)
2. Run `docker run --name yetiforce -e DB_HOST_NAME=yourhostname -e DATABASE_NAME=yourdatabasename -e DB_USER_NAME=yourusername -e DB_PASSWORD=yourpassword -e DB_TYPE=mysql -e DB_TCP_PORT=3306 -e DB_MANAGER=MysqlManager -p 8000:80 -d efero/yetiforcecrm`
3. Access `http://{docker_host}:8000` from your web browser to finish setting up YetiforceCRM.



