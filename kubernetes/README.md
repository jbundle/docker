kubectl create namespace istioinaction

# kubectl apply -f samples/httpbin/httpbin.yaml
kubectl apply -f gateway.yaml
kubectl apply -f karaf.yaml

# kubectl create secret tls tourgeek-credential -n istio-system  --key=/home/dcorley/workspace/certs/nginx/www.tourgeek.com/key.pem --cert=/home/dcorley/workspace/certs/nginx/www.tourgeek.com/fullchain.pem
kubectl create secret tls tourgeek-credential -n istio-system  --key=/run/secrets/certs/nginx/www.tourgeek.com/key.pem --cert=/run/secrets/certs/nginx/www.tourgeek.com/fullchain.pem

sudo kubectl port-forward deploy/istio-ingressgateway --address 192.168.1.139 -n istio-system 443:8443 80:8080
