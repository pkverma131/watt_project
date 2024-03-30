# Use an official Node runtime as a parent image
FROM node:20

# Set working directory
WORKDIR /app

# Install TypeScript globally
RUN npm install -g typescript

# Install Vite globally
RUN npm install -g vite

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy project
COPY . ./

# Build project
RUN yarn build

# Expose port
EXPOSE 4173

# Command to run the app
CMD ["vite", "preview", "--host", "0.0.0.0"]

