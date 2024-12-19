# DockerMaster - Container Management Automation Script

Welcome to **DockerMaster**, a powerful and easy-to-use shell script for managing Docker containers with just a few commands. Whether you're a developer, IT professional, or enthusiast, DockerMaster simplifies your containerization workflow by allowing you to quickly install Docker, launch essential containers, and manage your containerized environment efficiently.

This script is designed to streamline the process of managing Docker containers for various applications such as **Firefox**, **LibreOffice**, **Kali Linux**, **Obsidian**, and more. You can easily launch, stop, and remove containers, customize port mappings, and quickly view running containers—all from a single script.

---

## Key Features

- **Docker Installation**: Automatically install Docker and related tools on your system.
- **Launch Containers**: Easily launch a wide range of useful containers such as browsers, office tools, penetration testing tools, and more.
- **Port Customization**: Customize port mappings for each container on launch.
- **Container Management**: View running containers and their associated ports, stop and remove containers with just a few commands.
- **Enhanced Security**: Launch containers with appropriate security settings and optimizations.
- **Restart Policy**: Containers are configured to restart automatically unless manually stopped.

---

## Installation

1. **Clone the Repository**

   Start by cloning the repository to your local machine:
   ```bash
   git clone https://github.com/Purvapatel4725/Docker-Containers-Automation.git
   cd Docker-Containers-Automation
   ```

2. **Make the Script Executable**

   Ensure that the script is executable by running:
   ```bash
   chmod +x DockerMaster.sh
   ```

3. **Run the Script**

   To execute the script, use the following command:
   ```bash
   ./DockerMaster.sh
   ```

---

## Usage

### Main Menu

Once the script is running, you will be presented with the following menu of options:

```text
=========== DockerMaster ===========
1. Install Docker
2. Launch Containerized Browser (Firefox)
3. Launch LibreOffice
4. Launch IT Tools
5. Launch Kali Linux
6. Launch Obsidian
7. Launch Raspberry Pi Emulator
8. Show Running Containers and Ports
9. Stop and Remove a Container
0. Exit
=====================================
```

- **Install Docker**: Installs Docker and related dependencies. If Docker is already installed, you will be prompted to reinstall it.
- **Launch Containerized Browser (Firefox)**: Launches Firefox in a containerized environment.
- **Launch LibreOffice**: Launches LibreOffice in a containerized environment.
- **Launch IT Tools**: Launches a collection of useful IT tools for professionals.
- **Launch Kali Linux**: Launches a Kali Linux container for penetration testing.
- **Launch Obsidian**: Launches Obsidian, a note-taking and knowledge management tool.
- **Launch Raspberry Pi Emulator**: Launches a Raspberry Pi emulator in Docker.
- **Show Running Containers and Ports**: Displays a list of running containers with their associated ports.
- **Stop and Remove a Container**: Allows you to stop and remove a running container by selecting its ID.
- **Exit**: Exits the script.

### Docker Container Port Customization

For certain containers, such as **Firefox** and **LibreOffice**, the script will prompt you to customize the port mappings. If you prefer to use the default port, simply press **Enter** when prompted.

---

## Advantages

- **Ease of Use**: Simplifies Docker container management with a user-friendly menu interface.
- **Time-Saving**: Quickly set up and launch essential containers without complex commands.
- **Portability**: Easily share the script with colleagues or use it across multiple systems.
- **Security and Customization**: Provides security options (e.g., `seccomp`) and port customization to ensure a secure and personalized environment.
- **Docker Integration**: Automates the Docker installation and configuration process, saving time on setup.
- **Automated Restart**: Containers are configured with the `unless-stopped` restart policy, ensuring they automatically restart on system reboots.

---

## Example Commands

Here’s a quick example of how the script works in practice:

1. Launch **Firefox** in a container:
   - Select option `2` to launch the Firefox browser container.
   - Choose custom port mappings when prompted (or press Enter for defaults).

2. View running containers:
   - Select option `8` to see a list of all running containers and their associated ports.

3. Stop and remove a container:
   - Select option `9` to stop and remove a container by choosing its ID from the list.

---

## Built By

**DockerMaster** was created by [Purvapatel4725](https://github.com/Purvapatel4725) as a part of Docker container management automation.

---


## Acknowledgments

- Docker: A powerful containerization platform used to run containers.
- LinuxServer.io: Many Docker images (e.g., Firefox, LibreOffice) are based on their containers.
