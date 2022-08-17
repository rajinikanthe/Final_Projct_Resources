# Kubernates_Capstone_Project_PotureddyHari
## Setup EKS Cluster
> In this project we are supposed to set up an EKS cluster using a custom VPC. By default, EKS can create all VPC resources but we want to use our terraform created VPC resources instead. 

> Create an ECR repository to store the docker image of the node application.This repository will be used for deployment of the node application.

> Create a kubernetes deployment, service & ingress for upg-loadme app in the demo namespace.

>The deployment should have toleration for the taint given to the nodegroup created in the previous subtask.

>The deployment should use docker image pushed to the ECR repository.
## stateless app
### The app is an example of a stateless app as there is no state associated with any specific instance of the app. If any of the application pods gets killed the new pod spawned can substitute the previous pod without caring about the state of the dead pod.
> Deploy a single redis server in the demo namespace as statefulset named redis-server & use redis docker image

> Create a service of type ClusterIP to access redis-server statefulset pods on port 6379

> Use redis-cli (in the deployment pod) to connect to the service created for redis-server using the service name.

> Store some key-value pairs on the server. Delete the pod redis-server-0.

> Once the pod is restarted, reconnect using redis-cli and verify if key-value pairs are present
>> Example redis commands:

` ##  Connect to redis-server using redis-cli: redis-cli -h <redis_host_or_service_name> -p <port> `

  
` Set key=value: SET foo 1 `

` Get value of key: GET foo `

## Test auto scaling of the application. 
### After having deployed the upg-loadme application, it’s important to ensure that your application is able to scale well automatically in case of a surge in usage. Kubernetes has the concept of Horizontal Pod Autoscaler for handling scale up/down of deployment & statefulsets. 
> you will first ensure that an HPA is configured for scaling the deployed application and later test the scaling actions by simulating requests to the application using Apache Benchmark (ab) tool.

> List all hpa in demo namespace: 

  `  kubectl get hpa -n demo `
  
> Install prometheus on the cluster using the official helm chart

>Use kubectl port-forward to access the prometheus server from your system via service of prometheus.

> Generate load on upg-loadme app using ab tool to test hpa.
  - ab -n100 -c10 'http://<INSERT-LB-DNS>/load?scale=100'
  - Increase n to run the test for longer time by increasing request count 
  - Increase value of scale to 300 for higher load per call
 
 > command used to monitor the load on the pods
 
 `  kubectl top pods -n demo ` 

> Increase the load to trigger autoscaling of the upg-loadme app.

> Stop load test (ab command) and wait for pods and nodes to scale down.
  
` kubectl get hpa -n demo `
  
> By default, pods downscale may take 5 min after utilization drops below threshold & cluster-autoscaler may take 10 min to scale down nodes.
  
## Docker installation
> Reference link
> > https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
## Reference for kubectl and eksctl installation 

> https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html

## Eks-Metrics-server
> Reference link :
>> https://docs.aws.amazon.com/eks/latest/userguide/metrics-server.html

## Helm chat for redis cluster installing
> use: 
>> https://github.com/PotureddyHariCharan1/charts/tree/master/bitnami/redis

## Install prometheus on the cluster using the official helm chart 
> Use :
>> https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus
>>> ### Prometheus by default port forwarding will be on 9090
## Horizontal pod autoscaling 
> Reference : 
> >https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscalewalkthrough/#creating-the-autoscaler-declaratively

## Apache benchmark on our system 
> https://www.digitalocean.com/community/tutorials/how-to-use-apachebench-to-do-loadtesting-on-an-ubuntu-13-10-vps

