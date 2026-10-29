# Security

## Create ssh Certificate

```bash
ssh-keygen -t ed25519 -C "email@example.com"
```

## Add ssh Certificate to Server

```bash
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@server01.local
```

## login To Server

```bash
ssh 'user@server01.local'
```

## Secure ssh Login

```bash
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
```

## Restart Service

```bash
sudo systemctl daemon-reload
sudo systemctl reload ssh.service
sudo systemctl restart ssh.socket
sudo systemctl status ssh.service
```
