# Docker Kubernetes Golang Sample
An example of how to use Docker and Kubernetes in a Golang application

![CI](https://github.com/artursilveiradev/docker-k8s-golang-sample/actions/workflows/main.yml/badge.svg)

## API requests

### POST /send
```
curl --request POST \
  --url http://localhost/send \      
  --header 'content-type: application/json' \
  --data '{"value": "Hello World!"}'
```

### GET /
```
curl localhost
```
