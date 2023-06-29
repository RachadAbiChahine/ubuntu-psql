# Pull base image.
FROM ubuntu:22.04

# Install.
RUN \
  apt-get update && \
  apt-get install -y apt-utils git  curl postgresql-client postgresql-14-repack && \
  apt-get install -y telnet iputils-ping iproute2 wget&& \
  rm -rf /var/lib/apt/lists/*
# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root
COPY scripts .
VOLUME /root
# Define default command.
CMD ["bash", "entrypoint.sh"]
