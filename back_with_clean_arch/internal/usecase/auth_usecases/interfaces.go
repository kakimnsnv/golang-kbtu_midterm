package auth_usecases

import (
	"context"

	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/entity"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
)

type (
	Auth interface {
		Login(ctx context.Context, email string, password string) (entity.AuthResponse, logger.MyError)
		Register(ctx context.Context, email string, password string, username string) (entity.AuthResponse, logger.MyError)
	}

	AuthRepo interface {
		CreateUser(ctx context.Context, user entity.User) (entity.User, logger.MyError)
		GetUserByEmail(ctx context.Context, email string) (entity.User, logger.MyError)
	}
)
