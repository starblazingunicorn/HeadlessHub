# FROM alpine:latest
# WORKDIR /app
# COPY . .
# CMD ["echo", "Hello, Podman!"]


FROM node:latest

# Install dependencies
RUN apt-get update && apt-get install -y git

# Set the working directory
WORKDIR /HeadlessHub/Dockerfile

# Copy package.json and package-lock.json
COPY package.json .
COPY package-lock.json .

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Specify the command to run your application
# CMD ["node", "app.js"]
EXPOSE 8055

CMD ["npm", "start"]