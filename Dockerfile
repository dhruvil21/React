# Use an official Node.js runtime as the base image
FROM node:18 as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . ./

# Build the React app for production
RUN npm run build

# Use the Node.js base image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy the built React app from the build stage
COPY --from=build /app/build ./build
COPY package*.json ./

# Expose port 3000
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]
