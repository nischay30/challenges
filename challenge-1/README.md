## Challenge -1

Prerequisites -
* - gcloud authenticated already
* - kubectl (to interact with kubernetes)

I have tried using terraform to create basic infrastructure on GCP, though it's not complete right now. Below are the components
1 - For Application Layer - I have created an app engine using terraform on which front-end can be deployed. I have only created the infrastructure, haven't deployed any application on it. Reason for using app engine - It is Scalable and serverless and don't have to worry about lot of factors like SSl/TLS, security, Elasticity, etc.
    Created a small react app, which does the rest api call to the business logic layer. This will be deployed as Docker conatiner on Flex App-Engine.

2 - For Business Logic layer - I have created Kubernetes cluster. and have written a small nodejs app which will connect to Redis. Need to add the `REDIS_HOST IP` in `backend/deployment.yaml` to which it should connect. This service is exposed as LoadBalancer service. Have written the dockerfile to containerise it and deploying multiple replicas on the cluster. Can be enhanced by add metrics and HPA (Horizontal Pod Autoscaling), so that it should autoscale, when the load is increased.


3 - For Data Layer - I have created Managed Redis Service of GCP using terraform which can be referenced in the Business logic layer.

## Future Scope
Google Cloud Build or Github Actions can be added to do the CI/CD so that automatically it can deploy the components whenever changed or any commit happens to the SCM.