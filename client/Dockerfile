# Frontend Dockerfile - Development Mode
FROM node:16-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies with legacy peer deps to avoid conflicts
RUN npm install --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Start in development mode
CMD ["npm", "start"]
