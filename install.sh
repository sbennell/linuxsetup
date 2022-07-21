#!/bin/bash

# Find all dot files then if the original file exists, create a backup
# Once backed up to {file}.dtbak symlink the new dotfile in place
#for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
#    if [ -e ~/$file ]; then
#        mv -f ~/$file{,.dtbak}
#    fi
#    ln -s $PWD/$file ~/$file
#done

# Check if vim-addon installed, if not, install it automatically
#if hash vim-addon  2>/dev/null; then
#    echo "vim-addon (vim-scripts)  installed"
#else
#    echo "vim-addon (vim-scripts) not installed, installing"
#    sudo apt update && sudo apt -y install vim-scripts
#fi

mkdir -p ~/.ssh 

touch ~/.ssh/authorized_keys

echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDLEFMCtuN6KUoDQl3MPhFfkXE38D1AqSyjqBdtBnMAP6PbEipkLWNhUJ4dvtnOct4GtCTe73FJRrNzt6HnS6A69PbZ2KkODH6ju0d0yUWitsyasH5Ui38EwraxQ13swIFsdisGOfdm17tPifHLKdU+LDu67yb8g6M0W8265h63gNSkPNN6IKczGQBTjo2QyZxy4uARiq16VT4NVa+E8y6bisQMi088AyY/bYsKfrFRSDUWpJmnJp85fhs8tRFT17SnRBfXf9YsRiBLAFRQdk1Jout8E3UB1gKLJ/1xTjLLB5ujDKzX4RcZRglKKor+NVYH/1IZfdwidHILT/z8IRJbmZP4EdTwAplFou2tiVJyufCBkve+1oqlsJ+dnnwIthQfBuP6DMmq+n2Ba8vYlaMSO2dkNXeINCK3WWEEqJElQoAPNwtYeZ9QrXb+/kIGU1bZ35ieBz6V/HNAgpbit8TwGescM6B/vyg2q5qm2l8mAI6ltIGH4touBGb4nx01lsQx2oev3dBJcXMZZLh/dpbZQnxjKgxK8UqY/dS2LhP2zANUVHe607bdYRy8MdmQclbemKLkVy5xT6UnAd0MmnoDdiwUahez0+VSEhHMA8qju4t1p4OwxzrCLjjt5H5mcimnEM9TzxlwdCx3S3Wjo051u63x6qr6iJsMnZ1PqEFAew== sb >> ~/.ssh/authorized_keys

chmod -R go= ~/.ssh

echo "deb http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null

sudo apt update && sudo apt install nala

alias apt='nala'

sudo apt update
sudo apt -y autoremove
sudo apt clean
sudo apt purge -y $(dpkg -l | awk '/^rc/ { print $2 }')


echo "Installed"
