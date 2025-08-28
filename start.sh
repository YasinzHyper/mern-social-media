#!/bin/bash

# Cross-platform Docker setup script for MERN Social Media App
# Works on Linux, macOS, and Windows (with Git Bash or WSL)

echo "=========================================="
echo "MERN Social Media App - Docker Setup"
echo "=========================================="
echo ""

# Check if Docker is installed and running
echo "🔍 Checking Docker installation..."
if ! command -v docker >/dev/null 2>&1; then
    echo "ERROR: Docker is not installed."
    echo "Please install Docker:"
    echo "   • Windows/Mac: https://www.docker.com/products/docker-desktop"
    echo "   • Linux: https://docs.docker.com/engine/install/"
    exit 1
fi

if ! docker info >/dev/null 2>&1; then
    echo "ERROR: Docker daemon is not running."
    echo "Please start Docker and try again."
    exit 1
fi

echo "Docker found and running!"
echo ""

# Build and start all services
echo "Building and starting all services..."
docker-compose up --build -d

echo ""
echo "⏳ Waiting for services to initialize..."
sleep 15

echo ""
echo "=========================================="
echo "Application Status"
echo "=========================================="

# Check service status
if docker-compose ps | grep -q "Up"; then
    echo "Services are running!"
    echo ""
    echo "Access your application:"
    echo "   • Frontend:  http://localhost:3000"
    echo "   • Backend:   http://localhost:8080"
    echo "   • Database:  localhost:27017"
    echo ""
    echo "Useful commands:"
    echo "   • View logs:     docker-compose logs -f"
    echo "   • Stop app:      docker-compose down"
    echo "   • Restart:       docker-compose restart"
    echo ""
else
    echo "Some services may not be running properly."
    echo "Check logs: docker-compose logs"
fi

# Option to view logs
echo "Would you like to view live logs? (y/N)"
read -r response
if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Showing live logs (Press Ctrl+C to exit)..."
    docker-compose logs -f
fi

echo "Setup complete! Happy coding!"
