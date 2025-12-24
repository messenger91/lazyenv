# To install Docker within a WSL2 distribution, bypassing the Docker Desktop installation 
# and its associated warnings, follow these steps: Download the Docker installation script.
curl -fsSL https://get.docker.com -o get-docker.sh

# Execute the installation script.
sudo sh get-docker.sh

# Add your user to the Docker group: This allows you to run Docker commands without sudo.
sudo usermod -aG docker $USER

# You may need to log out and back in to your WSL session for this change to take effect. Verify Docker installation.
docker --version
docker compose version