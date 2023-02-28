# # Author: Abdul Basith

# base golang
FROM golang:1.17-alpine AS builder

# Set the working directory to /app
WORKDIR /app

# Install dependencies
RUN apk update && \
    apk add --no-cache git ca-certificates tzdata && \
    update-ca-certificates && \
    apk add vips-dev --verbose --update-cache --repository https://dl-3.alpinelinux.org/alpine/edge/testing/ --repository https://dl-3.alpinelinux.org/alpine/edge/main && \
    apk add build-base

# Copy the source code to the container
COPY go.mod go.sum ./
RUN go mod download

# Copy the application source code
COPY . .

# Build the application with optimized flags
RUN CGO_ENABLED=0 go build -ldflags="-w -s" -a -o /go/bin/app

# Use a smaller base image to reduce the size of the final image
FROM alpine:latest

# Install libvips library
RUN apk update && apk add --no-cache vips

# Set a non-root user for running the application
RUN adduser -S -D -H -h /app gouser
USER gouser

# Copy the application binary from the builder image
COPY --from=builder /go/bin/app /usr/local/bin/app

# Expose the application port
EXPOSE 8080

# Start the application
CMD ["app"]

