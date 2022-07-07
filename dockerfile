FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y python3 &&\
    apt-get install -y openssh-server
RUN mkdir -p /home/.ssh
WORKDIR /home
COPY app.py /home/app.py
COPY mach1.pub /home/.ssh/known_hosts
COPY sshd_config /etc/ssh/sshd_config
RUN service ssh restart
CMD ["/usr/bin/python3","./app.py"]
