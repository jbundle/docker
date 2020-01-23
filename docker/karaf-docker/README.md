Karaf in a container

1. To build:
cd ubuntu
docker build -t tourgeek/ubuntu .
cd ..

cd java/
docker build -t tourgeek/java .
cd ..
cd karaf
docker build -t tourgeek/karaf .
cd ..

2. To run

docker run --rm --name karaf -p 80:80 -p 443:443 -p 8181:8181 -d tourgeek/karaf
# docker run --rm --name karaf -p 80:80 -p 443:443 -p 8181:8181 -p 5005:5005 -d tourgeek/karaf-debug
# docker run -d --name karaf tourgeek/karaf
docker cp ~/workspace/workspace/artifacts/artifacts/src/main/resources/obr/repository/ karaf:/home/karaf/

docker exec -it karaf bash

/opt/apache/karaf/bin/client


feature:install http obr war
sleep 4000

obr:url-add file:///home/karaf/repository/jbundle-repository-1.0.10-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-view-swing-repository-1.0.5-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/tourgeek-repository-0.8.4-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-app-office-repository-1.1.4-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-util-repository-2.0.8-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-util-osgi-repository-2.0.10-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-util-auto-webstart-repository-1.6.10-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-util-calendarpanel-repository-1.1.6-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-util-jcalendarbutton-repository-1.6.5-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-util-other-repository-0.7.10-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-util-webapp-repository-1.3.7-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-util-wsdl-repository-1.0.5-SNAPSHOT.xml
obr:url-add file:///home/karaf/repository/jbundle-util-biorhythm-repository-0.8.7-SNAPSHOT.xml
  
obr:url-add file:///home/karaf/repository/jbundle-external-repository-1.0.3.xml
obr:url-add file:///home/karaf/repository/jbundle-util-osgi-wrapped-repository-1.0.4.xml
obr:url-add http://www.jibx.org/repository/repository.xml

# http://chameleon.ow2.org/repository/chameleon-releases.xml
# http://chameleon.ow2.org/repository/chameleon-commons.xml

# Start the OBR resource retrieval utility
obr:start -d 'jbundle-util-osgi-obr - obr bundle retrieval'
sleep 1000
# Start the OSGi to WebStart servlet
obr:start -d 'jbundle-util-osgi-webstart - osgi to web start web bundle'
sleep 1000
log:display


http://localhost:8181/webstart/bio.jnlp?mainClass=org.jbundle.util.biorhythm.Biorhythm
