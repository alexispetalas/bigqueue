# Pull base image.
FROM node:4.2.3

# Set app path directory to WORKDIR and run install
WORKDIR /code
COPY ./node_modules/jsdog-meli /code/node_modules/jsdog-meli

COPY package.json /code/
COPY npm-shrinkwrap.json /code/
COPY Makefile /code/

RUN npm install

# Add source code to container (all but in dockeringnore)
COPY . /code

# Exporse default port
EXPOSE 8081

# run 
CMD ["./bin/http_launcher.js"]

