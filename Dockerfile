# Use the newer, modern Node 22 environment required by the dependencies
FROM node:22-alpine

# Set our application workspace directory
WORKDIR /usr/src/app

# Copy configuration descriptors
COPY package*.json ./

# Force yarn to ignore engine blocks and install everything smoothly
RUN yarn install --ignore-engines && npm install -g typescript ts-node

# Copy the rest of your application code
COPY . .

# Expose the network protocol port
EXPOSE 8080

# Launch the project using the verified core tracking script
CMD ["npx", "ts-node", "src/index.ts"]
