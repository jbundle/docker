FROM tourgeek/java:latest
RUN apt update && apt -y upgrade
RUN apt install -y git maven icedtea-netx
RUN ln -s /usr/share/icedtea-web/javaws.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/javaws.jar
COPY lib/plugin.jar /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/
RUN mkdir -p /home/dcorley/workspace
WORKDIR /home/dcorley/workspace
RUN git clone https://github.com/tourgeek/workspace.git
WORKDIR /home/dcorley/workspace/workspace
RUN bin/git/checkout.sh
RUN mvn clean
RUN mvn verify --fail-never
RUN mvn clean install
