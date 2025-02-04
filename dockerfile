# Use the latest stable version of Node.js
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package.json package-lock.json ./

# Install dependencies (including Vite)
RUN npm install

# Copy all files from the project to the container
COPY . .

# Build the React app
RUN npm run build

# Install a lightweight static server (optional but can be helpful for production)
RUN npm install -g serve

# Expose the port the app runs on
EXPOSE 3000

# Serve the built app
CMD ["serve", "dist"]

