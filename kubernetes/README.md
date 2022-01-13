# Set up tour system on Kubernetes

kubectl create namespace istioinaction

# kubectl create secret tls tourgeek-credential -n istio-system  --key=/home/dcorley/workspace/certs/nginx/www.tourgeek.com/key.pem --cert=/home/dcorley/workspace/certs/nginx/www.tourgeek.com/fullchain.pem
kubectl create secret tls tourgeek-credential -n istio-system  --key=/run/secrets/dcorley/certs/letsencrypt/www.tourgeek.com/key.pem --cert=/run/secrets/dcorley/certs/letsencrypt/www.tourgeek.com/fullchain.pem

# kubectl apply -f samples/httpbin/httpbin.yaml
kubectl apply -f gateway.yaml
kubectl apply -f karaf.yaml
#+ kubectl exec -t karaf-xyz client shell:source mvn:org.jbundle.config/jbundle-artifacts/1.4.1/shell/setup

sudo kubectl port-forward deploy/istio-ingressgateway --address 192.168.1.139 -n istio-system 443:8443 80:8080

# Remove:

kubectl delete -f gateway.yaml
kubectl delete -f karaf.yaml