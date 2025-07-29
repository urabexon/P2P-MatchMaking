package entity

import (
	"time"

	"golang.org/x/net/websocket"
)

type User struct {
	conn      *websocket.Conn
	id        string
	createdAt time.Time
}

func NewUser(conn *websocket.Conn, id string, createdAt time.Time) *User {
	return &User{conn, id, createdAt}
}
