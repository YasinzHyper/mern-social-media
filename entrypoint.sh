#!/bin/bash

# Wait for MongoDB to be ready
echo "Waiting for MongoDB to be ready..."
sleep 10

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
fi

# Start the application
echo "Starting backend server..."
if command -v nodemon >/dev/null 2>&1; then
    echo "Using nodemon for development..."
    exec nodemon server.js
else
    echo "Using node..."
    exec node server.js
fi
