FROM tourgeek/karaf-obr:latest
RUN sed -i '/^    http:\/\/repository.apache.org/d' /opt/apache/karaf/etc/org.ops4j.pax.url.mvn.cfg;
RUN sed -i '/^    https:\/\/oss.sonatype.org/d' /opt/apache/karaf/etc/org.ops4j.pax.url.mvn.cfg;
RUN sed -i 's/\@id=central, \\/\@id=central, \\\nhttps:\/\/maven.jx.tourgeek.com\/repository\/maven-public\@id=ops4j.sonatype.snapshots.deploy\@snapshots\@noreleases/g' /opt/apache/karaf/etc/org.ops4j.pax.url.mvn.cfg
