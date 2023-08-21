# Use the official Node.js image as the base image
FROM node:14 AS builder

# Set the working directory within the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the rest of the app's source code to the working directory
COPY . .

# Build the app
RUN npm run build

# Use a lightweight image for serving the built app
FROM nginx:alpine

# Copy the built app from the builder stage to the nginx HTML directory
COPY --from=builder /app/build /usr/share/nginx/html

# Expose port 80 to the outside worl
EXPOSE 80

# Command to start the Nginx server
CMD ["nginx", "-g"]
