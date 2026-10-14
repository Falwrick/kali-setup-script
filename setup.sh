#!/bin/bash
# Updating APT first
apt update

#Initial Tool Install
apt install git -y
apt install wget -y
apt install tmux -y
apt install nmap -y
apt install proxychains4 -y
apt install netexec -y
apt install iputils-ping -y
apt install whatweb -y
apt install dnsutils -y
apt install enum4linux-ng -y

cd /opt
#Get kerbrute binary
mkdir /opt/kerbrute
cd /opt/kerbrute
wget https://github.com/ropnop/kerbrute/releases/download/v1.0.3/kerbrute_linux_amd64
chmod +x kerbrute_linux_amd64

#Install more tools

gem install evil-winrm
apt install pipx -y
pipx install git+https://github.com/login-securite/DonPAPI.git
apt install bettercap -y
pipx install impacket
pipx ensurepath

cd /opt
git clone https://github.com/dirkjanm/PKINITtools.git
git clone https://github.com/dirkjanm/ldapdomaindump.git
git clone https://github.com/dirkjanm/PrivExchange.git
git clone https://github.com/NotMedic/NetNTLMtoSilverTicket.git
git clone https://github.com/topotam/PetitPotam.git
git clone https://github.com/Hackndo/lsassy.git
git clone https://github.com/zyn3rgy/LdapRelayScan.git
git clone https://github.com/fox-it/BloodHound.py.git
git clone https://github.com/epi052/feroxbuster.git
git clone https://github.com/lgandx/Responder.git
git clone https://github.com/p0dalirius/Coercer.git
git clone https://github.com/lgandx/PCredz.git
git clone https://github.com/cython/cython.git
git clone https://github.com/caizhengxin/python-libpcap.git
git clone https://github.com/trustedsec/SeeYouCM-Thief
apt install libpcap-dev -y
apt install cython3 -y
#apt install python3.9 -y
#apt install python3.9-dev -y
apt install mitm6 -y
apt install python3-aioquic -y
apt install python3-pcapy -y

#Get Valk binary
cd /opt
mkdir Valkyrie
cd Valkyrie
wget https://github.com/Dirkenhymer/Valkyrie-2/releases/download/v0.1.3-beta/valk2
chmod +x valk2

#cd /opt/cython
#python3 setup.py build && python3 setup.py install

cd /opt/python-libpcap
python3 setup.py build && python3 setup.py install

cd /opt/lsassy
python3 setup.py install

apt install certipy-ad -y

cd /opt/BloodHound.py
python3 setup.py install

cd /opt/ldapdomaindump
chmod +x ldapdomaindump.py

#Install gowitness
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb -y
rm google-chrome-stable_current_amd64.deb
cd /root/
wget https://go.dev/dl/go1.26.1.linux-amd64.tar.gz
tar -xvf go1.26.1.linux-amd64.tar.gz
rm go1.26.1.linux-amd64.tar.gz
export PATH=$PATH:/root/go/bin
go install github.com/sensepost/gowitness@latest

apt install neovim -y

# Personal Tmux Config
cat > /root/.tmux.conf <<'TMUXCONF'
# Core behaviour
set -g mouse on
set -s set-clipboard on
setw -g mode-keys vi
bind-key -T copy-mode-vi v send-keys -X begin-selection
bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -i"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "xclip -selection clipboard -i"

# Sensible defaults (replaces the tmux-sensible plugin)
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"
set -sg escape-time 10
set -g history-limit 50000
set -g display-time 2000
set -g status-interval 5
set -g focus-events on
set -g base-index 1
setw -g pane-base-index 1
set -g renumber-windows on
bind r source-file ~/.tmux.conf \; display-message " ~/.tmux.conf reloaded"
TMUXCONF
