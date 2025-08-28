#!/bin/sh

# Try to use nodemon if available, fallback to node
if command -v nodemon >/dev/null 2>&1; then
    echo "Starting with nodemon..."
    exec nodemon server.js
else
    echo "Nodemon not found, starting with node..."
    exec node server.js
fi
