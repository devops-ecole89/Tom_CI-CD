FROM ubuntu

# Set the working directory to /home/ubuntu.
# Every command after this will be executed in this directory.
WORKDIR /home/ubuntu

# Install SSH
RUN apt update && apt-get install -y sudo openssh-server ssh && rm -rf /var/lib/apt/lists/*
RUN usermod -aG sudo ubuntu

# Configure SSH
RUN mkdir /var/run/sshd

RUN mkdir -p /home/ubuntu/.ssh && chmod 700 /home/ubuntu/.ssh

COPY <<YOUR PUBLIC KEY FILE>> /home/ubuntu/.ssh/authorized_keys
RUN chmod 600 /home/ubuntu/.ssh/authorized_keys && chown -R ubuntu:ubuntu /home/ubuntu/.ssh

# Open port 22 to allow SSH into the container
EXPOSE 22

# Usage ssh : ssh <user>@<nom du container>
# We set user as "ubuntu" and password as "password"
RUN echo 'ubuntu:password' | chpasswd

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
