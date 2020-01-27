FROM tourgeek/ubuntu:latest

ENV TZ=America/Los_Angeles
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y ubuntu-desktop
