# Docker Image for testing REST API

TASK: Design a RESTful API with Python and Flask in order to test API Gateway, Reverse Proxy or Load balancer on Layer7.

Deploy this Flask REST API on Docker/Kubernetes and test endpoints.

Flask is a lightweight framework for building web applications.

A REST API is an interface that accepts connections via the internet, executes some business logic, and then returns a result. Fundamentally, that means that an API has input, business logic, and output. 

Methods: GET, POST, DELETE, PUT.

This image can be used to test your API Gateway, Reverse Proxy or Layer 7 Application Load balancers.

## Docker start

``` 
docker buildx build --platform linux/amd64 -t pijer10/rest-api-testing:latest .
docker run -d -p 5000:5000 pijer10/rest-api-testing
```

## REST API call examples:

```
@app.route('/', methods=['GET'])
@app.route('/todo/api/v1.0/tasks', methods=['GET'])
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['GET'])
@app.route('/todo/api/v1.0/tasks', methods=['POST'])
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['PUT'])
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['DELETE'])
```


## Kubernetes Deployment

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: rest-api-deployment
  namespace: playground
  labels:
    app: rest-api
spec:
  replicas: 1
  selector:
    matchLabels:
      app: rest-api
  template:
    metadata:
      labels:
        app: rest-api
    spec:
      containers:
        - name: rest-api-container
          image: pijer10/rest-api-testing:2.0
          ports:
            - containerPort: 5000
---
apiVersion: v1
kind: Service
metadata:
  name: rest-api-service
spec:
  selector:
    app: rest-api
  ports:
    - protocol: TCP
      port: 80
      targetPort: 5000
  type: ClusterIP
```
