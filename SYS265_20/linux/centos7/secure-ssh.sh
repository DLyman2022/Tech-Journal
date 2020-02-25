#secure-ssh.sh
#author DLyman (DLyman2022)
#creates a new ssh user using $l parameter
#adds a public key from the local repo or curled from the remote repo
#removes roots ability to ssh in
sudo useradd -m -d /home/$1 -s /bin/bash $1
echo "$1 created"
sudo mkdir /home/$1/.ssh
echo "Directory Created"
ssh-keygen -t rsa -C "$1"
sudo cp ~/.ssh/id_rsa.pub .
sudo cp centos7/id_rsa.pub /home/$1/.ssh/authorized_keys
sudo chmod 700 /home/$1/.ssh
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/.ssh
