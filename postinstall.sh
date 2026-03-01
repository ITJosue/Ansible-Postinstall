#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting system setup..."

# 1. Install Git and Ansible
# We use sudo here as package installation requires root privileges.
echo "Installing Git and Ansible..."
sudo dnf install -y git ansible

# 2. Clone the repository
echo "Cloning the Ansible-Postinstall repository..."
# We remove the directory first if it already exists to prevent clone errors
if [ -d "Ansible-Postinstall" ]; then
    rm -rf Ansible-Postinstall
fi
git clone https://github.com/ITJosue/Ansible-Postinstall.git

# 3. Change into the directory
cd Ansible-Postinstall

# 4. Run the Ansible playbook
echo "Running the local.yml playbook..."
ansible-playbook local.yml --ask-become-pass

echo "Setup complete!"
