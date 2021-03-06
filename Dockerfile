# Pull base image.
FROM ubuntu:20.04

# Install.
RUN \
  apt-get update && \
  apt-get install -y apt-utils git vim curl postgresql-client && \
  apt-get install -y telnet iputils-ping iproute2 && \
  rm -rf /var/lib/apt/lists/*
# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root
COPY scripts .
VOLUME /root
# Define default command.
CMD ["bash", "entrypoint.sh"]