# Use the newer, modern Node 22 environment required by the dependencies
FROM node:22-alpine

# Set our application workspace directory
WORKDIR /usr/src/app

# Copy the tracking configuration layouts
COPY package*.json yarn.lock* ./

# Bypass the strict environmental engine validation check to clear build limits
RUN yarn install --ignore-engines

# Copy the rest of your application code
COPY . .

# Expose the network protocol port
EXPOSE 8080

# Run the project file engine directly
CMD ["node", "build/index.js"]
