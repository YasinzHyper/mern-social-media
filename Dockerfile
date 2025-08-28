# Backend Dockerfile
FROM node:18-alpine

WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Make entrypoint script executable
RUN chmod +x entrypoint.sh

# Create uploads directory for storing images
RUN mkdir -p uploads

# Expose the port
EXPOSE 8080

# Use custom entrypoint script
CMD ["./entrypoint.sh"]
