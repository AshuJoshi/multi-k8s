docker build -t ashujoshi/multi-client:latest -t ashujoshi/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ashujoshi/multi-server:latest -t ashujoshi/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t ashujoshi/multi-worker:latest -t ashujoshi/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push ashujoshi/multi-client:latest
docker push ashujoshi/multi-client:$SHA
docker push ashujoshi/multi-worker:latest
docker push ashujoshi/multi-worker:$SHA
docker push ashujoshi/multi-server:latest
docker push ashujoshi/multi-server:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=ashujoshi/multi-client:$SHA
kubectl set image deployments/server-deployment server=ashujoshi/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=ashujoshi/multi-worker:$SHA

