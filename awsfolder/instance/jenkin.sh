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

#install jenkins on ec2 instance mac linux
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

#Custom TCP 8080 0.0.0.0/0







