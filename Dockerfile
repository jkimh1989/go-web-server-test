# Build stage
FROM golang:1.20 AS builder
WORKDIR /app
COPY main.go ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o go-webserver main.go

# Final stage
FROM ubi8-minimal:latest
RUN apk add --no-cache ca-certificates
WORKDIR /app
COPY --from=builder /app/go-webserver .
EXPOSE 8080
CMD ["./go-webserver"]
