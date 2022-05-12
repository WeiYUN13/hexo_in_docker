# hexo in docker
A docker container for deploy hexo framwork.

Features included:
- Full isolated hexo environment, including node js, npm, hexo-cli
- Preinstalled hexo theme fluid
- Linked to github and github page with one step

# Getting started with hexo in docker
Build an hexo_in_docker image from Dockerfile by
```shell
docker build -t hexo_in_docker .
```
An image called `hexo_in_docker` will be built.

From the image, creating a docker container by passing configurations to it:
```shell
docker run -it --name=blog \
  -e HEXO_SERVER_PORT=4000 \
  -e GIT_USER="WeiYUN13" \
  -e GIT_EMAIL="yunwei_ecpkn@buaa.edu.cn" \
  -e GIT_SSH_KEY="`cat ~/.ssh/id_rsa_blog`" \
  -v ~/Desktop/yunwei/blog:/blog \
  -p 4000:4000 \
  hexo_in_docker
```
Updating blog by running:
```shell
docker exec -it blog hexo g
```
Config deployment to github by:
```yml
deploy:
  type: git
  repo: git@github.com:weiyun13/weiyun13.github.io.git
  branch: master
```