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