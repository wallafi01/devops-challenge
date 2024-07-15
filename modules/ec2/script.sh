
#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y nginx
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 'Nginx HTTP'
sudo ufw --force enable
sudo systemctl restart nginx
sudo chown -R $USER:$USER /path/to/some/directory

##aget ssm
sudo snap install amazon-ssm-agent --classic
sudo systemctl enable amazon-ssm-agent
sudo systemctl start amazon-ssm-agent

##cloud watch agent

sudo apt-get install -y awscli

# Instalando Cloud Watch Agent
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb -P /tmp
sudo dpkg -i /tmp/amazon-cloudwatch-agent.deb

# Cconfigurando CloudWatch Agent
sudo tee /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json > /dev/null <<EOF
{
    "agent": {
        "metrics_collection_interval": 60,
        "run_as_user": "cwagent"
    },
    "metrics": {
        "append_dimensions": {
            "InstanceId": "\${aws:InstanceId}"
        },
        "metrics_collected": {
            "mem": {
                "measurement": [
                    "mem_used_percent"
                ]
            },
            "swap": {
                "measurement": [
                    "swap_used_percent"
                ]
            },
            "disk": {
                "measurement": [
                    "used_percent"
                ],
                "metrics_collection_interval": 60,
                "resources": [
                    "*"
                ]
            }
        }
    },
    "logs": {
        "logs_collected": {
            "files": {
                "collect_list": [
                    {
                        "file_path": "/var/log/syslog",
                        "log_group_name": "/var/log/syslog",
                        "log_stream_name": "{instance_id}"
                    },
                    {
                        "file_path": "/var/log/auth.log",
                        "log_group_name": "/var/log/auth.log",
                        "log_stream_name": "{instance_id}"
                    }
                ]
            }
        }
    }
}
EOF

#instalando codeDeploy Agent
sudo apt-get update
sudo apt-get install -y wget
wget https://aws-codedeploy-$(curl -s https://s3.amazonaws.com/aws-codedeploy-us-east-1/latest/codedeploy-agent-ubuntu.service) -O /etc/init.d/codedeploy-agent

sudo chmod +x /etc/init.d/codedeploy-agent
sudo service codedeploy-agent start
sudo update-rc.d codedeploy-agent defaults
