Use at your own risk! Read the script before you run it. 

## Install

1. Run

```bash
# if root
wget -qO - https://raw.githubusercontent.com/sbennell/linuxsetup/master/install.sh -c -O install.sh && bash install.sh  && rm install.sh 

# if non-root
wget -qO - https://raw.githubusercontent.com/sbennell/linuxsetup/master/install.sh -c -O install.sh && sudo bash install.sh  && rm install.sh 

```

# Installation
### Download and change folder
```
cd ~
git clone https://github.com/sbennell/linuxsetup.git

cd linuxsetup
```
### Run install
```
chmod +x ./install.sh
./install.sh
```

# Uninstallation

### Change to dotfiles folder
```
cd ~/linuxsetup
```

### Run uninstaller
```
./uninstall.sh
```
