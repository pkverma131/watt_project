# Use an official node runtime as a parent image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json .

# Install dependencies
RUN npm install 

# Copy project files
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Run the Vite development server
CMD ["npm", "run", "dev"]
