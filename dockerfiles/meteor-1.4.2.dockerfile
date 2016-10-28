# Dockerfile
FROM debian

# Install Meteor
RUN apt-get update
RUN apt-get -y install curl procps python g++ make
RUN curl "https://install.meteor.com/?release=1.4.2" | sh

# Runs an example Meteor project to warm up
RUN meteor --unsafe-perm create /root/meteortest
WORKDIR /root/meteortest
RUN meteor --unsafe-perm build .
WORKDIR /
RUN rm -rf /root/meteortest

