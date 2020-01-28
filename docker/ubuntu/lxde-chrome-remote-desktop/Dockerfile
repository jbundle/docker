FROM dorowu/ubuntu-desktop-lxde-vnc:latest

RUN cd /tmp
RUN apt update && apt upgrade -y && apt install -y wget
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
RUN apt update && apt-get install -y /root/chrome-remote-desktop_current_amd64.deb
RUN rm chrome-remote-desktop_current_amd64.deb
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt update && apt-get install -y /root/google-chrome-stable_current_amd64.deb
RUN rm google-chrome-stable_current_amd64.deb