#!/bin/bash
sudo apt-get update
yes | sudo apt install openjdk-11-jdk-headless
echo "Waiting for 30 seconds before installing the jenkins package..."
sleep 30
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
yes | sudo apt-get install jenkins
sleep 30
echo "Waiting for 30 seconds before installing the Terraform..."
wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_386.zip
yes | sudo apt-get install unzip
unzip 'terraform*.zip'
sudo mv terraform /usr/local/bin/



# */
# # sudo apt update
# # sudo apt install openjdk-17-jdk -y
# # wget https://get.jenkins.io/war-stable/latest/jenkins.war
# # java -jar jenkins.war --httpPort=8080
# */

#install jenkins on ec2 instance Amazon Linux EC2
# sudo yum update -y
# sleep 30
# sudo yum install java-17-amazon-corretto -y
# sleep 30
# java -version
# sleep 30
# sudo wget -O /etc/yum.repos.d/jenkins.repo \ https://pkg.jenkins.io/redhat-stable/jenkins.repo
# sleep 30
# sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# sudo yum install jenkins -y
# sudo systemctl start jenkins
# sudo systemctl enable jenkins
# sudo systemctl status jenkins

#Custom TCP 8080 0.0.0.0/0 #### install git and maven on ec2 instance mac linux
# sudo dnf install git -y
# sudo dnf install git docker maven -y
# sudo systemctl start docker #start docker service
# sudo systemctl enable docker
# sudo usermod -aG docker jenkins  #add jenkins user to docker
# sudo systemctl restart jenkins



############################################
######################################### Full Jenkins DevOps Setup Script (Ubuntu)
# #!/bin/bash

# echo "Updating system..."
# sudo apt update -y

# echo "Installing required packages..."
# sudo apt install -y curl wget git unzip gnupg software-properties-common

# echo "Installing Java..."
# sudo apt install openjdk-17-jdk -y

# echo "Installing Jenkins..."
# curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | \
# sudo gpg --dearmor -o /usr/share/keyrings/jenkins-keyring.gpg

# echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.gpg] \
# https://pkg.jenkins.io/debian-stable binary/ | \
# sudo tee /etc/apt/sources.list.d/jenkins.list

# sudo apt update
# sudo apt install jenkins -y

# sudo systemctl enable jenkins
# sudo systemctl start jenkins

# echo "Installing Docker..."
# sudo apt install docker.io -y
# sudo systemctl enable docker
# sudo systemctl start docker

# sudo usermod -aG docker jenkins
# sudo usermod -aG docker ubuntu

# echo "Installing Maven..."
# sudo apt install maven -y

# echo "Installing NodeJS..."
# curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
# sudo apt install nodejs -y

# echo "Installing AWS CLI..."
# sudo apt install awscli -y

# echo "Installing Terraform..."
# wget -O- https://apt.releases.hashicorp.com/gpg | \
# gpg --dearmor | \
# sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
# https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
# sudo tee /etc/apt/sources.list.d/hashicorp.list

# sudo apt update
# sudo apt install terraform -y

# echo "Installing kubectl..."
# curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
# chmod +x kubectl
# sudo mv kubectl /usr/local/bin/

# echo "Installing Helm..."
# curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# echo "Restarting Jenkins..."
# sudo systemctl restart jenkins

# echo "Setup Complete!"


# chmod +x jenkins-devops-setup.sh
# ./jenkins-devops-setup.sh
# http://EC2_PUBLIC_IP:8080
# sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# git --version
# docker --version
# mvn -version
# node -v
# terraform version
# kubectl version --client
# helm version
# aws --version