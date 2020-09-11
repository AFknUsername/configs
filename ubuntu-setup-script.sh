#! /bin/bash
# Install all programs using apt
sudo apt update && sudo apt upgrade -y 
sudo apt install -y \
    neovim git curl \
    i3 i3blocks htop \
    tmux nitrogen ssh \
    apt-transport-https\
    build-essential fzf \
    cmake python3-dev \
    pkg-config libfreetype6-dev\
    libfontconfig1-dev libxcb-xfixes0-dev \
    python2-neovim python3-neovim

# Install brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update && sudo apt install brave-browser -y

# Install alacritty and create shortcuts, replace default terminal
cd ~ 
mkdir software
cd software
git clone https://github.com/alacritty/alacritty.git
cd alacritty

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable
cargo build --release

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
echo "source $(pwd)/extra/completions/alacritty.bash" >> ~/.bashrc

# Install vim-plug and plugins, compile YCM
## Install vim-plug for neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

## Install plugins
nvim +PlugInstall +qa

## Compile YCM
cd ~/.config/nvim/plugged/youcompleteme
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go nodejs
python3 install.py --ts-completer --go-completer --java-completer --clangd-completer

# Generate ssh key
echo "Generating ssh key pair"
cd ~/.ssh
cat /dev/zero | ssh-keygen -q -N ""

# Download wallpaper repo
cd ~
git clone https://gitlab.com/dwt1/wallpapers.git

# Build fzf
cd ~/software
git clone https://github.com/junegunn/fzf.git
cd fzf
make install
