package service

import "github.com/dankru/golang-todo/pkg/repository"

type Authorization interface {
}

type TodoList interface {
}

type TodoItem interface {
}

type Service struct {
	Authorization
	TodoList
	TodoItem
}

//Внедрение зависимостей
func NewService(repos *repository.Repository) *Service {
	return &Service{}
}