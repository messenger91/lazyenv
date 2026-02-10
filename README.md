# lazyenv - Local Environment Manager

## Project Overview

lazyenv is a local environment management tool designed to improve developer experience by simplifying the setup and management of development environments. It provides utilities for configuring system settings, managing Docker containers for various services, and automating common development tasks.

The project is organized around three main areas:
- **Config**: System configuration files for SSH, WSL, and bash aliases
- **Docker**: Pre-configured Docker containers for popular services
- **Scripts**: Installation and utility scripts for common development tools

## Architecture

The project follows a modular architecture with the following key components:

- `lazyenv` - Main executable script that serves as the command-line interface
- `lazyenv.config.example` - Configuration template with version definitions and IP assignments
- `Makefile` - Contains common commands for environment management
- `config/` - System configuration files
- `docker/` - Service-specific Docker configurations
- `scripts/` - Installation and utility scripts

## Building and Running

### Prerequisites
- Docker
- Bash-compatible shell
- curl (for some installation scripts)

### Setup Process

1. **Initialize configuration**:
   ```bash
   cp lazyenv.config.example lazyenv.config
   # Edit lazyenv.config with your specific paths and settings
   ```

2. **Create Docker network**:
   ```bash
   ./lazyenv docker-net
   # Or using make: make create-net
   ```

3. **Install required tools**:
   ```bash
   ./lazyenv install nvm
   ./lazyenv install docker-wsl  # if on WSL
   ```

4. **Build and run Docker services**:
   ```bash
   ./lazyenv docker-container-build postgres
   ./lazyenv docker-container-build redis
   # etc. for other services
   ```

### Available Commands

#### Main Interface (`./lazyenv`)
- `./lazyenv help` - Show available commands
- `./lazyenv install {name}` - Install tools by script name (e.g., `nvm`, `docker-wsl`)
- `./lazyenv run-util {name}` - Run utility scripts
- `./lazyenv docker-net` - Create Docker network
- `./lazyenv docker-container-ip {name}` or `dci {name}` - Get container IP address
- `./lazyenv docker-container-build {service}` - Build service container
- `./lazyenv docker-container-update {service}` - Update service container
- `./lazyenv pg-dump {db}` - Create PostgreSQL database dump
- `./lazyenv pg-restore {db} {file}` - Restore PostgreSQL database
- `./lazyenv psql-restore {db} {file}` - Restore SQL file to PostgreSQL
- `./lazyenv mongodump {db}` - Create MongoDB dump
- `./lazyenv mongorestore {db} {date}` - Restore MongoDB database
- `./lazyenv sync-dump` - Copy dumps to pg_dump directory
- `./lazyenv pg-list` - List available dump files

#### Makefile Commands
- `make env-prepare` - Initialize .env from example
- `make create-net` - Initialize Docker networks
- `make docker-container-ip container={name}` - Check container IP
- `make docker-build-container name={name}` - Build container by name
- `make docker-update-container name={name}` - Update container by name
- `make postgres-dump db={database}` - Create pg_dump by database name
- `make postgres-restore db={database} date={timestamp}` - Restore pg database
- `make mongodump db={database}` - Create mongodump by database name
- `make mongorestore db={database} date={timestamp}` - Restore mongo database

### Supported Services

The project includes pre-configured Docker setups for:
- Consul
- Grafana
- Jaeger
- Kafka
- MongoDB
- NATS
- NGINX
- PostgreSQL
- RabbitMQ
- Redis

Each service has dedicated directories under `docker/` with build and update scripts.

### Configuration

The `lazyenv.config` file contains:
- Project folder path
- Application version definitions (NVM, etc.)
- Docker image tags for all supported services
- Fixed IP addresses for Docker containers on the custom network
- Utility configurations for database dumps, DBeaver scripts, and GitHub repositories

## Development Conventions

- Shell scripts follow bash conventions
- Docker containers use fixed IP addresses on a custom bridge network (172.23.0.0/24)
- Each Docker service has its own directory with build/update scripts
- Configuration values are centralized in the config file for easy management
- The project uses a consistent naming convention for commands and variables

## Key Features

1. **Network Management**: Creates a custom Docker network with fixed IP assignments for predictable service connectivity
2. **Database Utilities**: Includes scripts for PostgreSQL and MongoDB backup/restore operations
3. **System Configuration**: Provides configuration files for SSH, WSL, and bash aliases
4. **Service Management**: Standardized approach to building and updating Docker containers
5. **Installation Scripts**: Automated installation of common development tools
6. **Utility Functions**: Helper scripts for common development tasks

## Usage Examples

```bash
# Set up the environment
cp lazyenv.config.example lazyenv.config
# Edit the config file with your settings
./lazyenv docker-net

# Install development tools
./lazyenv install nvm

# Build and run PostgreSQL container
./lazyenv docker-container-build postgres

# Check container IP
./lazyenv docker-container-ip postgres

# Create a database dump
./lazyenv pg-dump mydatabase

# List available dumps
./lazyenv pg-list
```