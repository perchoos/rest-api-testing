# Deploy your Flask REST API on Docker 

TASK: Design a RESTful API with Python and Flask in order to test API Gateway, Reverse Proxy or Load balancer on Layer7.

## Docker Image

``` 
docker buildx build --platform linux/amd64 -t pijer10/rest-api-testing:latest .
docker run -d -p 5000:5000 pijer10/rest-api-testing
```

## Flask API

```
@app.route('/', methods=['GET'])
@app.route('/todo/api/v1.0/tasks', methods=['GET'])
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['GET'])
@app.route('/todo/api/v1.0/tasks', methods=['POST'])
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['PUT'])
@app.route('/todo/api/v1.0/tasks/<int:task_id>', methods=['DELETE'])
```


## Dockerfile

```
FROM alpine:latest

RUN apk update
RUN apk add py-pip
RUN apk add --no-cache python3-dev 
RUN pip install --upgrade pip

COPY requirements.txt /tmp/requirements.txt
RUN pip --no-cache-dir install -r /tmp/requirements.txt

WORKDIR /app
COPY . /app

EXPOSE 5000

CMD ["python3", "app.py"]
```
