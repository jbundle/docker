FROM tourgeek/karaf
COPY /src /tmp/src
RUN $KARAF_HOME/bin/start
RUN sleep 20
RUN $KARAF_HOME/bin/client -f /tmp/src/commands.txt
RUN sleep 5
