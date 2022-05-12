GIT_USERNAME=$1
GIT_EMAIL=$2
GIT_SSH_KEY=$3
HEXO_SERVER_PORT=$4

# check if there is already a mount volume
if [[ "$(ls -A /blog)" ]]; then
    echo "Blog already exists, continuing"
else
    echo "Start initialize blog"
    hexo init
    git clone https://github.com/fluid-dev/hexo-theme-fluid.git ./themes/fluid
    rm -rf ./themes/fluid/.git
fi

npm install
npm install hexo-deployer-git --save

# set up ssh key for deployment to github page
echo "**Setting GIT_SSH_KEY as github ssh key**"
echo "**Please make sure the ssh public key has already be set in github**"
git config --global user.name "${GIT_USERNAME}"
git config --global user.email "${GIT_EMAIL}}"
mkdir -p ~/.ssh && echo "${GIT_SSH_KEY}" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan github.com > ~/.ssh/known_hosts 2>/dev/null

# start hexo server
echo "**Start hexo server on port ${HEXO_SERVER_PORT}**"
echo "**Please check the blog at localhost:${HEXO_SERVER_PORT}**"
hexo server -d -p ${HEXO_SERVER_PORT}
