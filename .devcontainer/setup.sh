#!/bin/bash
AWS_CLI_V2_URL='https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip'

mkdir ~/.tmp && cd $_

# install aws-cli v2
curl "${AWS_CLI_V2_URL}" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  sudo ./aws/install

touch ~/.aws/credentials && chmod 600 $_

echo "generate the ~/.aws/config"

cat << EOF > ~/.aws/config
[default]
sso_start_url = https://skiller-whale.awsapps.com/start
sso_region = eu-west-1
sso_account_id = 003725240431
sso_role_name = AWSReadOnlyAccess
region = eu-west-1
EOF

