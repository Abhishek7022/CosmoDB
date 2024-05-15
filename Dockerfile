FROM ubuntu:20.04

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean

# Set up SSH user and password (replace 'dbuser1' and 'mysecretpassword' with your desired credentials)
RUN useradd -rm -d /home/dbuser1 -s /bin/bash -g root -G sudo -u 1000 dbuser1 && \
    echo 'dbuser1:postgresql' | chpasswd

# Create directory for SSH keys
RUN mkdir /home/dbuser1/.ssh

# Copy SSH configuration files
COPY sshd_config /etc/ssh/sshd_config
COPY authorized_keys /home/dbuser1/.ssh/authorized_keys

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]
