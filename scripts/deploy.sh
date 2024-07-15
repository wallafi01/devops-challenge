#!/bin/bash
set -e
GITHUB_TOKEN="{{ secrets.token_git }}"
cd /usr/share/nginx/html
git clone https://${GITHUB_TOKEN}}@github.com/feegow/totem-legado.git
sudo systemctl restart nginx