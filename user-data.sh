#!/bin/bash

sudo yum install git -y
git clone https://github.com/kdevops-2020/sentry-migration.git /tmp/git
cd /tmp/git
sudo sh sentry.sh
