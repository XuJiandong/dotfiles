mkdir -p ~/.ssh
echo $SSH_PUBLIC_KEY | base64 -d > ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/id_rsa.pub
echo $SSH_PRIVATE_KEY | base64 -d > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

echo 'export PS1="$ "' >> ~/.bashrc
echo 'export PS1="[%1d]$ "' >> ~/.zshrc

git config --global user.name $GIT_USER
git config --global user.email $GIT_EMAIL


code --install-extension matklad.rust-analyzer

