#!/bin/bash

echo "===== UPDATE SYSTEM ====="
sudo apt update -y

echo "===== INSTALL GIT ====="
sudo apt install git -y

echo "===== INSTALL DOCKER ====="
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

echo "===== INSTALL JAVA ====="
sudo apt install openjdk-17-jdk -y

echo "===== INSTALL JENKINS ====="
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install jenkins -y
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "===== DONE ====="
echo "Reboot machine to apply Docker group"
