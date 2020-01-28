# maven-proxy
Maven proxy is an envoy proxy that auto-loads the most current snapshot from a maven repo.

It uses a Lua script to read the metadata file and then load the correct SNAPSHOT file.

To build: ./docker-build.sh

To add to a jx cluster: kubectl apply -f k8s/proxy/maven.yaml