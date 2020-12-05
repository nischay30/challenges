
docker build -t gcr.io/$PROJECT_ID/backend .

docker push gcr.io/$PROJECT_ID/backend:latest


kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
