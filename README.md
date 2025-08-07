# P2P-MatchMaking ⚡️

A simple WebSocket server implemented in Go and dedicated to real-time 1-on-1 matchmaking.

## Demo 🛜

![demo](demo.gif)
Example of two WebSocket clients being matched into the same room in real time.

## Usage 🧑‍💻

Server start (defalt listen port: 8000, change -flag option)
```bash
go run ./main.go
```

Prepare two WebSocket clients and connect to the server.

Example using [wscat](https://github.com/websockets/wscat):
```bash
$ wscat -c ws://localhost:8000/matchmaking
Connected (press CTRL+C to quit)
> {"user_id": "test-user1", "created_at": "2099-12-31T23:59:58+00:00"}
# if you matching:
< {"type":"MATCH","room_id":"68be89f","user_id":"test-user2","created_at":"2024-05-29T20:43:03.897592+09:00"}
```

Run with Docker:
```bash
docker build -t p2p-matchmaking .
docker run --rm -p 8000:8000 -e SLACK_WEBHOOK_ENDPOINT=<your_webhook_url> p2p-matchmaking
```

## WebSocket Protocol 📡

Request (from client):
```bash
{
  "user_id": "user123",
  "created_at": "2025-08-08T00:00:00Z"
}
```

Response (from server):
```bash
{
  "type": "MATCH",
  "room_id": "abc1234",
  "user_id": "user456",
  "created_at": "2025-08-08T00:00:01Z"
}
```

## Environment Variable 🍩
| KEY | Description |
| --- | --- |
|`SLACK_WEBHOOK_ENDPOINT` | If you specify a Slack webhook endpoint, a message will be delivered when a user enters.|
