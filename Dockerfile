# Build stage
FROM golang:1.20 AS builder
WORKDIR /app
COPY main.go ./
RUN go build -o go-webserver main.go

# Final stage
FROM alpine:latest
RUN apk add --no-cache ca-certificates
WORKDIR /app
COPY --from=builder /app/go-webserver .
EXPOSE 8080
CMD ["./go-webserver"]
