if test ! -e /ide/bin/remote-cli/gp-code || test ! -v GITPOD_REPO_ROOT; then {
    printf 'error: This script is meant to be run on Gitpod, quitting...\n' && exit 1;
} fi

mkdir -p ~/.ssh
echo $SSH_PUBLIC_KEY | base64 -d > ~/.ssh/id_rsa.pub
chmod 644 ~/.ssh/id_rsa.pub
echo $SSH_PRIVATE_KEY | base64 -d > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

git config --global user.name $GIT_USER
git config --global user.email $GIT_EMAIL

code --install-extension matklad.rust-analyzer

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
echo "alias gs='git status'" >> $HOME/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git z jump zsh-autosuggestions dirhistory)/' $HOME/.zshrc
