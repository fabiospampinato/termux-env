# Packages
pkg install -y bc fd fzf git htop hub jq micro nnn nodejs openssh termux-api tmux zsh
# NPM Packages
npm install -g lodash prettier
# Env
git clone https://github.com/fabiospampinato/termux-env.git
# Micro
cp -r termux-env/micro ~/.config
# Tmux
cp termux-env/tmux/.tmux.conf ~/.tmux.conf
# Zsh
chsh -s zsh
cp termux-env/zsh/.zshrc ~/.zshrc
exec $(which zsh) -l
