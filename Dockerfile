# Use the newer, modern Node 22 environment required by the dependencies
FROM node:22-alpine

# Set our application workspace directory
WORKDIR /usr/src/app

# Copy the tracking configuration layouts
COPY package*.json yarn.lock* ./

# Bypass strict environmental engine validation checks
RUN yarn install --ignore-engines

# Install ts-node globally so we can run the raw code files immediately
RUN npm install -g ts-node typescript

# Copy the rest of your application code
COPY . .

# Expose the network protocol port
EXPOSE 8080

# Launch the project using the verified core tracking script
CMD ["npx", "ts-node", "src/index.ts"]
