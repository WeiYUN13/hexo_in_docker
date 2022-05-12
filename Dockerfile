FROM node:18-slim
LABEL maintaner="Wei YUN <yunwei_ecpkn@buaa.edu.cn>"

RUN \
    apt-get update && \
    apt-get install git -y && \
    npm install -g hexo-cli

# set workdir
WORKDIR /blog
COPY start_hexo_server.sh /

# set git related env for deploy to github page
ENV GIT_USERNAME="WeiYUN13"
ENV GIT_EMAIL="yunwei_ecpkn@buaa.edu.cn"
ENV GIT_SSH_KEY=""

# set hexo server configurations
ENV HEXO_SERVER_PORT=4000
EXPOSE ${HEXO_SERVER_PORT}

# config git for deploy
CMD bash /start_hexo_server.sh "${GIT_USERNAME}" "${GIT_EMAIL}" "${GIT_SSH_KEY}" "${HEXO_SERVER_PORT}"
