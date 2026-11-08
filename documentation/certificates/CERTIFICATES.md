# Certificate

## Install SSH Server

sudo apt-get install openssh-server

sudo systemctl status ssh.socket ssh.service
sudo systemctl status ssh.service

sudo systemctl enable ssh --now
sudo systemctl start ssh

## Set Environment Variables

export USER_NAME=oct
export USER_PASSWORD=Aa123456
export CERTIFICATE_PASSWORD=Aa123456
export SERVER_IP=x.x.x.x

## Create Local User

sudo useradd $USER_NAME && sudo passwd $USER_NAME echo $USER_NAME:$USER_PASSWORD | sudo chpasswd

## Create SSH Certificate

ssh-keygen -t ed25519 -C $USER_NAME SSH Login Key ed25519 with Password -f ssh_login_key_ed25519 -N $CERTIFICATE_PASSWORD

## Copy SSH Certificate to Remote Server

ssh-copy-id -i ssh_login_key_ed25519.pub $USER_NAME@$SERVER_IP
sudo ssh -i 'ssh_login_key_ed25519' $USER_NAME@$SERVER_IP

## get MD5 key fingerprint

ssh-keygen -l -f ssh_login_key_ed25519.pub
export readonly TMOUT=600
sudo apt-get install openssh-server

## Setup SSH Server Login

sudo vi /etc/ssh/sshd_config

AuthenticationMethods publickey
PubkeyAuthentication yes
#HostKey /home/tzahi/.ssh/id_ed25519
HostKeyAlgorithms ssh-ed25519
KexAlgorithms curve25519-sha256
#Ciphers chacha20-poly1305@openssh.com,aes256-gcm@openssh.com
#MACs hmac-sha2-512-etm@openssh.com
HostbasedAcceptedKeyTypes ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,ssh-ed25519
PermitRootLogin no
PasswordAuthentication no
PermitEmptyPasswords no
LoginGraceTime 2m
MaxAuthTries 6
ClientAliveInterval 100
ClientAliveCountMax 3

### Restart Service to Apply Changes

sudo systemctl daemon-reload
sudo systemctl reload ssh.service
sudo systemctl restart ssh.socket
sudo systemctl status ssh.service

### File Permissions issues

#### Windows PowerShell

icacls.exe ssh_login_key_ed25519 /reset
icacls.exe ssh_login_key_ed25519 /GRANT:R "$($env:USERNAME):(R)"
icacls.exe ssh_login_key_ed25519 /inheritance:r

#### Linux

sudo chmod 644 ssh_login_key_ed25519

## Copy Files with SCP

### Using SSH

ssh $USER_NAME@$SERVER_IP ssh-copy-id -i ssh_login_key_ed25519.pub $USER_NAME@$SERVER_IP ssh -i 'ssh_login_key_ed25519' $USER_NAME@$SERVER_IP

### Using SCP

scp -i 'ssh_login_key_ed25519' kubernetes_cluster.sh $USER_NAME@$SERVER_IP:kubernetes_cluster.sh
