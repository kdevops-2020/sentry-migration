#! /bin/bash
sudo rm -rf /tmp/sentry
mkdir /tmp/sentry
cd /tmp/sentry
git clone https://github.com/AshutoshJha786/onpremise.git
if [ $? -ne 0 ]; then
  echo "repository not cloned"
   exit 1
fi
cd onpremise
#sudo yum install docker -y
#sudo service docker start
sudo sh docker_install.sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo rm -f /usr/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
export SKIP_USER_PROMPT=1
sudo ./install.sh --no-user-prompt
if [ $? -ne 0 ]; then
 echo "script failed"
 exit 1
fi
sudo docker-compose up -d
