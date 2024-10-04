package auth_usecases

import (
	"context"
	"fmt"
	"time"

	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/entity"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/auth"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
)

type AuthUseCase struct {
	repo AuthRepo
}

func NewAuthUseCase(repo AuthRepo) *AuthUseCase {
	return &AuthUseCase{repo}
}

func (uc *AuthUseCase) Login(ctx context.Context, email string, password string) (entity.AuthResponse, logger.MyError) {
	user, err := uc.repo.GetUserByEmail(ctx, email)
	if err.Err != nil {
		return entity.AuthResponse{}, logger.MyError{LogMsg: fmt.Errorf("AuthUseCase - Login - uc.repo.GetUserByEmail: %w", err.LogMsg), Err: err.Err}
	}

	ok := auth.CheckPasswordHash(password, user.Password)

	if !ok {
		return entity.AuthResponse{}, logger.MyError{LogMsg: fmt.Errorf("AuthUseCase - Login - invalid password"), Err: logger.ErrorInvalidPassword}
	}
	user.Password = ""

	token, tokenErr := auth.GenerateJWTToken(user.ID, time.Hour*240)
	if tokenErr != nil {
		return entity.AuthResponse{}, logger.MyError{LogMsg: fmt.Errorf("AuthUseCase - Login - auth.GenerateJWTToken: %w", tokenErr), Err: logger.ErrorJWT}
	}

	authResponse := entity.AuthResponse{
		User:         user,
		Token:        token,
		RefreshToken: token,
	}

	return authResponse, logger.MyError{}
}

func (uc *AuthUseCase) Register(ctx context.Context, email string, password string, username string) (entity.AuthResponse, logger.MyError) {
	hashedPassword, hashError := auth.HashPassword(password)
	if hashError != nil {
		return entity.AuthResponse{}, logger.MyError{LogMsg: fmt.Errorf("AuthUseCase - Register - auth.HashPassword: %w", hashError), Err: logger.ErrorJWT}
	}

	user, err := uc.repo.CreateUser(ctx, entity.User{Username: username, Email: email, Password: hashedPassword})
	if err.Err != nil {
		if err.Err == logger.ErrorDuplicate {
			return entity.AuthResponse{}, logger.MyError{LogMsg: fmt.Errorf("AuthUseCase - Register - uc.repo.CreateUser: %w", err.LogMsg), Err: logger.ErrorUserAlreadyExists}
		}
		return entity.AuthResponse{}, logger.MyError{LogMsg: fmt.Errorf("AuthUseCase - Register - uc.repo.CreateUser: %w", err.LogMsg), Err: err.Err}
	}

	token, tokenErr := auth.GenerateJWTToken(user.ID, time.Hour*240)
	if tokenErr != nil {
		return entity.AuthResponse{}, logger.MyError{LogMsg: fmt.Errorf("AuthUseCase - Login - auth.GenerateJWTToken: %w", tokenErr), Err: logger.ErrorJWT}
	}

	authResponse := entity.AuthResponse{
		User:         user,
		Token:        token,
		RefreshToken: token,
	}

	return authResponse, logger.MyError{}
}
