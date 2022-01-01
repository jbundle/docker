FROM tourgeek/ubuntu:latest as builder

ENV KARAF_VERSION=4.2.12
ENV X=1
COPY docker-files-cache /tmp/
RUN tar zxvf /tmp/apache-karaf* -C /tmp/
RUN rm /tmp/*.tar.gz
# COPY release/apache-maven-$MAVEN_VERSION-bin.tar.gz /tmp/
# RUN tar zxvf /tmp/apache-maven-$MAVEN_VERSION-bin.tar.gz -C /tmp

FROM tourgeek/java:latest
ENV KARAF_VERSION=4.2.12

# Karaf environment variables
ENV KARAF_INSTALL_PATH /opt/apache
ENV KARAF_HOME $KARAF_INSTALL_PATH/karaf
# ENV PATH $PATH:$KARAF_HOME/bin
RUN mkdir -p $KARAF_INSTALL_PATH

# USER karaf
RUN mkdir -p /home/karaf
WORKDIR /home/karaf

COPY --from=builder /tmp/apache-karaf-$KARAF_VERSION $KARAF_INSTALL_PATH/apache-karaf-$KARAF_VERSION
RUN set -x && ln -s $KARAF_INSTALL_PATH/apache-karaf* $KARAF_HOME && ln -s $KARAF_HOME/bin/karaf /usr/local/bin/karaf && ln -s $KARAF_HOME/bin/client /usr/local/bin/client

# COPY --from=builder /tmp/apache-maven-$MAVEN_VERSION /opt/apache/apache-maven-$MAVEN_VERSION
# RUN ln -s /opt/apache/apache-maven-$MAVEN_VERSION /opt/apache/maven
# RUN ln -s /opt/apache/maven/bin/mvn /usr/local/bin/mvn

RUN chmod 755 /opt
# RUN sed -i "21s/out/stdout/" /opt/apache/karaf/etc/org.ops4j.pax.logging.cfg;

EXPOSE 8101 1099 44444 8181 80 443
CMD ["karaf", "run"]
