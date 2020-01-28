FROM tourgeek/karaf:latest
# FROM apache/karaf:4.2.7
COPY /src /tmp/src
RUN apt update && apt upgrade -y && apt install -y procps
# RUN $KARAF_HOME/bin/start && sleep 20 && $KARAF_HOME/bin/client -f /tmp/src/commands.txt && sleep 5 && $KARAF_HOME/bin/stop && sleep 10
# RUN $KARAF_HOME/bin/start ; sleep 20 ; $KARAF_HOME/bin/client info ; sleep 5 ; $KARAF_HOME/bin/stop ; sleep 10
RUN sed -i 's/http:\/\/repo1.maven.org/https:\/\/repo1.maven.org/g' /opt/apache/karaf/etc/org.ops4j.pax.url.mvn.cfg
#RUN $KARAF_HOME/bin/start;\
#ps -A;\
#sleep 20;\
#ps -A;\
#cat /tmp/src/commands.txt;\
#$KARAF_HOME/bin/client -f /tmp/src/commands.txt;\
#ps -A;\
#sleep 5;\
#$KARAF_HOME/bin/client feature:install obr;\
#ps -A;\
#sleep 5;\
#$KARAF_HOME/bin/stop;\
#ps -A;\
#sleep 10
