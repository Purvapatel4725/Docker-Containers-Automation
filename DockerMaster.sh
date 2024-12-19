#!/bin/bash

# DockerMaster: A master script for managing Docker containers

# Function to check if Docker is installed
check_docker_installed() {
  if command -v docker &> /dev/null; then
    echo "Docker is installed."
    return 0
  else
    echo "Docker is not installed."
    return 1
  fi
}

# Function to display the menu
display_menu() {
  echo -e "\n=========== DockerMaster ==========="
  echo "1. Install Docker"
  echo "2. Launch Containerized Browser (Firefox)"
  echo "3. Launch LibreOffice"
  echo "4. Launch IT Tools"
  echo "5. Launch Kali Linux"
  echo "6. Launch Obsidian"
  echo "7. Launch Raspberry Pi Emulator"
  echo "8. Show Running Containers and Ports"
  echo "9. Stop and Remove a Container"
  echo "0. Exit"
  echo "====================================="
}

# Function to install Docker
install_docker() {
  if check_docker_installed; then
    echo "Warning: Docker is already installed. Do you want to reinstall it? (yes/no)"
    read -p "> " choice
    if [[ "$choice" != "yes" ]]; then
      echo "Skipping Docker installation."
      return
    fi
  fi

  echo "Installing Docker..."
  sudo apt-get update && \
  sudo apt-get install -y ca-certificates curl gnupg && \
  sudo install -m 0755 -d /etc/apt/keyrings && \
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
  sudo chmod a+r /etc/apt/keyrings/docker.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  sudo apt-get update && \
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
  sudo systemctl start docker && \
  sudo usermod -aG docker $(whoami)
  echo "Docker installation complete. Please restart your terminal session."
}

# Function to handle user exit
check_exit() {
  if [[ "$1" == "exit" ]]; then
    echo "Exiting DockerMaster. Goodbye!"
    exit 0
  fi
}

# Function to launch a container with custom ports and show its link
launch_container() {
  local container_name=$1
  local image_name=$2
  local default_ports=($3)

  echo "Launching $container_name..."

  local ports=()
  for port_pair in "${default_ports[@]}"; do
    local host_port=${port_pair%%:*}
    local container_port=${port_pair#*:}
    read -p "Enter port for $host_port (default $host_port): " custom_port
    check_exit "$custom_port"
    custom_port=${custom_port:-$host_port}
    ports+=("-p $custom_port:$container_port")
    echo "Access it here: http://localhost:$custom_port"
  done

  docker run -d --name="$container_name" --security-opt seccomp=unconfined -e PUID=1000 -e PGID=1000 -e TZ=Etc/UTC ${ports[@]} --shm-size="1gb" --restart unless-stopped "$image_name"
  echo "$container_name launched successfully!"
}

# Function to show running containers and ports
show_running_containers() {
  echo -e "\nRunning containers:"
  docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" | sed '1d' | nl -w2 -s'. '
}

# Function to stop and remove a container
stop_remove_container() {
  echo -e "\nSelect a container to stop and remove:"
  containers=($(docker ps --format "{{.ID}}"))
  docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" | sed '1d' | nl -w2 -s'. '

  read -p "Enter the number of the container to stop (or 'exit' to quit): " choice
  check_exit "$choice"
  if [[ "$choice" -gt 0 && "$choice" -le "${#containers[@]}" ]]; then
    container_id="${containers[$((choice-1))]}"
    docker stop "$container_id" && docker rm "$container_id"
    echo "Container $container_id stopped and removed."
  else
    echo "Invalid choice. Returning to menu."
  fi
}

# Main loop
while true; do
  display_menu
  read -p "Enter your choice (or type 'exit' to quit): " choice
  check_exit "$choice"

  case $choice in
    1)
      install_docker
      ;;
    2)
      launch_container "firefox" "lscr.io/linuxserver/firefox:latest" "5000:3000"
      ;;
    3)
      launch_container "libreoffice" "lscr.io/linuxserver/libreoffice:latest" "3005:3000 3006:3001"
      ;;
    4)
      launch_container "it-tools" "corentinth/it-tools" "8080:80"
      ;;
    5)
      launch_container "kali-linux" "lscr.io/linuxserver/kali-linux:latest" "3000:3000 3001:3001"
      ;;
    6)
      launch_container "obsidian" "lscr.io/linuxserver/obsidian:latest" "3003:3000 3004:3001"
      ;;
    7)
      echo "Launching Raspberry Pi Emulator..."
      docker run -it lukechilds/dockerpi
      ;;
    8)
      show_running_containers
      ;;
    9)
      stop_remove_container
      ;;
    0)
      echo "Exiting DockerMaster. Goodbye!"
      break
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
done
