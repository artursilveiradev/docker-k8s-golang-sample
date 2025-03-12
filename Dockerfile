# syntax=docker/dockerfile:1

FROM golang:1.24.1-alpine AS build-stage

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-k8s-golang-sample

FROM build-stage AS run-test-stage
RUN go test -v ./...

FROM gcr.io/distroless/base-debian11 AS build-release-stage

WORKDIR /

COPY --from=build-stage /docker-k8s-golang-sample /docker-k8s-golang-sample

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/docker-k8s-golang-sample"]