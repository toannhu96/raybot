FROM golang:1.22.5-bookworm as builder

RUN apt update && apt install curl unzip -y

ENV GOPATH=/go

RUN go install github.com/google/wire/cmd/wire@v0.6.0

WORKDIR /src

# Copy go mod and sum files
COPY go.mod go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download || true

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Build docker
RUN make di static


######## Start a new stage from scratch #######
FROM alpine:3.13 as production

RUN apk --no-cache add ca-certificates tzdata htop tini bash curl

RUN rm -rf /tmp/*

# Change timezone to UTC/GMT
ENV TZ=UTC
RUN cp /usr/share/zoneinfo/UTC /etc/localtime

# Copy the Pre-built binary file from the previous stage
COPY --from=builder /src/out /bin/

HEALTHCHECK --interval=30s --timeout=30s --retries=5 --start-period=30s CMD curl -f http://localhost:8081/ || exit 1

EXPOSE 8081

# Command to run the executable
CMD ["tini", "--", "/bin/raybot"]