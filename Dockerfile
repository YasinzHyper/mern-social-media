# Backend Dockerfile
FROM node:18-alpine

WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Create uploads directory for storing images
RUN mkdir -p uploads

# Expose the port
EXPOSE 8080

# Default command (will be overridden by docker-compose)
CMD ["npm", "run", "dev"]
