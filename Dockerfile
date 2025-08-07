FROM golang:1.24.1-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /p2p-matchmaking ./main.go

FROM alpine:latest

# Slack webhook
RUN apk --no-cache add ca-certificates

WORKDIR /

COPY --from=builder /p2p-matchmaking /p2p-matchmaking

EXPOSE 8000

ENV SLACK_WEBHOOK_ENDPOINT=""

ENTRYPOINT ["/p2p-matchmaking"]