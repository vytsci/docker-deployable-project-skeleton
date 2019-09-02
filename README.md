1. Search and replace ``projectname`` with your actual project name
2. Search and replace ``yourdockerregistrey`` with your actual project docker registry
3. Build images
  * ``docker build .docker/image/base -t yourdockerregistrey/projectname/base:latest``
  * ``docker build .docker/image/runner -t yourdockerregistrey/projectname/runner:latest``
  * ``docker build .docker/image/server/web -t yourdockerregistrey/projectname/server/web:latest``
4. Push images
  * ``docker push yourdockerregistrey/projectname/base:latest``
  * ``docker push yourdockerregistrey/projectname/runner:latest``
  * ``docker push yourdockerregistrey/projectname/server/web:latest``
5. Copy ``docker-compose.yml.dist-dev``
