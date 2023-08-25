# Use an official Node.js image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Build the React app (replace 'build' with your actual build command)
RUN npm run build

EXPOSE 3000

# Specify the command to start the app (replace 'start' with your actual start command)
CMD ["npm", "start"]

