#!/bin/bash -xe

pgrep node || true

echo "/================================SETUP================================\\"
echo "|=====================================================================|"
export DBUS_SESSION_BUS_ADDRESS=/dev/null
export http_proxy=${https_proxy}
# export http_proxy=${https_proxy:-http://PITC-Zscaler-Americas-Cincinnati3PR.proxy.corporate.ge.com:80}
export test_env_url=${test_env_url:-'https://mos-qa-1.run.aws-usw02-pr.ice.predix.io'}


python --version
which pip
pip --version
echo "|=====================================================================|"
echo "\\=====================================================================/"
pip install -U --user robotframework-selenium2library
pip install -U --user robotframework-databaselibrary
pip install -U --user xlrd
google-chrome --version
wget http://chromedriver.storage.googleapis.com/2.27/chromedriver_linux64.zip -e use_proxy=yes -e http_proxy=$http_proxy
unzip chromedriver_linux64.zip
export PATH="$(pwd)":$PATH
echo "PATH="$PATH
which chromedriver

git clone https://257e3e01e6e35f29422ae63dc3706218a5ae9da2@github.build.ge.com/material-maturity/ph-connectivity-node-service

ls .
cd ph-connectivity-node-service

# Use the --userconfig flag to point to a local .npmrc (can be named to taste)
# This allows us to do `npm config set proxy someproxyval`
# Avoids permissions issues related to /home/jenkins/.npmrc
# Or set the USERCONFIG environment variable to avoid having to pass the userconfig flag all the time
npm config ls -l --userconfig ./tmpNpmRc
npm install --userconfig ./tmpNpmRc


#DEBUG=ph:client uaa=$uaa clientid=$clientid clientsecret=$clientsecret node ph-connectivity-node-service/example/client || true &
./start_clients.sh

# Change Directory back to wherever you came from one step prior
cd -
wget https://pypi.python.org/packages/f6/40/2c46b72b4d78e7e9241426e6f60302ae1b38acac805f4c93346db64f6b70/psycopg2-2.7.1-cp35-cp35m-manylinux1_x86_64.whl#md5=f183544a6ba2839ee1930f57c1e7cba2
https_proxy=$https_proxy pip install -U --user psycopg2
# no sudo because e.x., sjc1jenkins09 "no tty / askpass"

# Jenkins has an automatic process killer so we can just run this in the background and not worry about it
# https://wiki.jenkins.io/display/JENKINS/ProcessTreeKiller
# Jenkins may run up to 4 executors per node, so there's a high chance this process will already be running on this port


#kill `lsof -i tcp:7999 | awk 'NR!=1 {print $2}'` || true
https_proxy=$https_proxy pip install -U --user requests
https_proxy=$https_proxy pip install -U --user robotframework-requests

cd Modules
#robot --argumentfile stock_policy.robot



robot --variable WELCOME.URL:${app_instance_url} --variable dbfile:Resources/${db_config_filename} --argumentfile ${argument_file}
# robot --variable WELCOME.URL:${app_instance_url} --variable dbfile:Resources/${db_config_filename} --argumentfile ${argument_file}
