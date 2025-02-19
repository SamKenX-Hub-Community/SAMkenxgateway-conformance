FROM golang:1.20-alpine
WORKDIR /app
ENV GATEWAY_CONFORMANCE_HOME=/app

COPY ./go.mod ./go.sum ./
RUN go mod download

COPY . .
RUN go build -o ./gateway-conformance ./cmd/gateway-conformance

ENTRYPOINT ["/app/gateway-conformance"]
