# Start with the official Go image for building
FROM golang:1.20 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the source code into the container
COPY main.go ./

# Build the Go binary
RUN go build -o go-webserver main.go

# Use a smaller base image for the final image
FROM alpine:latest

# Install CA certificates to support HTTPS if needed
RUN apk add --no-cache ca-certificates

# Set the working directory for the final image
WORKDIR /app

# Copy the built binary from the builder stage
COPY --from=builder /app/go-webserver .

# Expose the port the app listens on
EXPOSE 8080

# Set the binary as the default command
CMD ["./go-webserver"]
