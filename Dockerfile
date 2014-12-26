FROM dockerfile/nodejs
MAINTAINER Tim Owens <tim@reclaimhosting.com>

# Ports
    EXPOSE 80

# Grunt needs git
    RUN apt-get -y install git

# Install grunt
    RUN npm install -g grunt-cli

# Install Bower
    RUN npm install -g bower

# Install Sails.js
    RUN npm install -g sails

# Create app directory
    RUN mkdir /api

# Get the boilerplate template
    RUN git clone https://github.com/timmmmyboy/sailsjs-api-template.git /api

# Set the working directory
    WORKDIR /api/

# Add local settings
    ADD local.js config/local.js

# Install and Lift
    RUN npm install
    ENTRYPOINT ["sails", "lift"]
