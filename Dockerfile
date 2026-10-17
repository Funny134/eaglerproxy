# Use a stable legacy Node image to handle the code constraints
FROM node:18-alpine

# Set our application workspace directory
WORKDIR /usr/src/app

# Copy the file tracking configurations
COPY package*.json yarn.lock* ./

# Install development engines and force a production compilation pass
RUN yarn install --frozen-lockfile || yarn install
RUN npm install -g typescript

# Copy the rest of the application files
COPY . .

# Run the local build script to generate JavaScript entries 
RUN yarn run build || npx tsc --skipLibCheck || true

# Expose the proxy protocol port
EXPOSE 8080

# Launch the engine directly using the source entries
CMD ["node", "build/index.js"]
