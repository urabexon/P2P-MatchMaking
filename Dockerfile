FROM golang:1.23.4-alpine AS builder

WORKDIR /src

RUN apk update && apk add --no-cache git

COPY . .

RUN go mod download
RUN go build -o -p /src/p2p-matchmaking main.go

FROM alpine:latest

WORKDIR /

COPY --from=builder /src/p2p-matchmaking /usr/local/bin/p2p-matchmaking

ENTRYPOINT ["/usr/local/bin/p2p-matchmaking"]