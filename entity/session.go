package entity

import (
	"sync"
)

type Session[T comparable] struct {
	queue []T
	sync.Mutex
}

func NewSession[T comparable]() *Session[T] {
	return &Session[T]{queue: make([]T, 0)}
}
