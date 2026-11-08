# Certificates

## Server SSH Login

ssh-keygen -t ed25519 -C "GitHub SSH Login Key ed25519 with Password" -f github_ssh_login_key_ed25519 -N PASSWORD
gh repo deploy-key add github_ssh_login_key_ed25519.pub -t 'GitHub SSH Login Key ed25519 with Password' --repo 'user/repo'
gh repo deploy-key list -R 'user/repo'
gh repo deploy-key delete 'KEY_ID' -R 'user/repo'

## GitHub

### SSH Login

ssh-keygen -t ed25519 -C "GitHub SSH Login Key ed25519 without Password" -f github_ssh_login_key_ed25519
gh repo deploy-key add github_ssh_login_key_ed25519.pub -t 'GitHub SSH Login Key ed25519 without Password' --repo 'user/repo'
gh repo deploy-key list -R 'user/repo'
gh repo deploy-key delete 'KEY_ID' -R 'user/repo'

### GPG

gpg --batch --full-generate-key <<EOF
Key-Type: EDDSA
Key-Curve: ed25519
Subkey-Type: RSA
Subkey-Length: 4096
Name-Real: User Name
Name-Comment: GitHub SSH Login Key ed25519 with Password
Name-Email: <user@gmail.com>
Expire-Date: 1y
Passphrase: PASSWORD
%commit
EOF

export GPG_KEY_ID=$(gpg --with-colons --fingerprint --list-keys "github" | grep -A 1 "pub:" | grep -Eo "[A-F0-9]{40}")
gpg --armor --export $GPG_KEY_ID > pgp_key.key
gh gpg-key add pgp_key.key -t 'GitHub GPG Key ECC with Password'
gh gpg-key list

gh gpg-key delete KEY_ID

ssh-keygen -t ed25519 -C "GitHub SSH Login Key ed25519 with Password" -f github_ssh_login_key_ed25519 -N PASSWORD
gh ssh-key add github_ssh_login_key_ed25519.pub -t 'GitHub SSH Login Key ed25519 with Password'
gh ssh-key list
gh ssh-key delete 'KEY_ID'
