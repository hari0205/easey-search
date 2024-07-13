FROM node:22-bullseye-slim 


# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Copy yarn lock.
COPY yarn.lock ./

# Install app dependencies (docker images come with yarn bundled)
RUN yarn install

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN yarn build

# Expose port
EXPOSE 3000

# Start the server using the production build
CMD [ "node", "dist/main.js" ]