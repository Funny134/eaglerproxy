# Use a highly stable legacy Node environment to match the proxy template rules
FROM node:18-alpine

# Set the active work directory
WORKDIR /usr/src/app

# Copy configuration descriptors
COPY package*.json ./

# Install packages, force local TypeScript installation tools, and clear caching boundaries
RUN yarn install && npm install typescript ts-node

# Copy the rest of the source application files
COPY . .

# Expose the proxy networking interface port
EXPOSE 8080

# Boot up the server using the local typescript executor
CMD ["npx", "ts-node", "src/index.ts"]
