package auth_usecases

import (
	"context"
	"fmt"
	"strings"

	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/entity"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/postgres"
)

type AuthRepoImpl struct {
	*postgres.Postgres
}

func NewAuthRepo(pg *postgres.Postgres) *AuthRepoImpl {
	return &AuthRepoImpl{pg}
}

func (r *AuthRepoImpl) CreateUser(ctx context.Context, user entity.User) (entity.User, logger.MyError) {
	sql, args, err := r.Builder.
		Insert("users").Columns("username", "email", "password").
		Values(user.Username, user.Email, user.Password).
		Suffix("RETURNING id, username, email, created_at").
		ToSql()
	if err != nil {
		return entity.User{}, logger.MyError{LogMsg: fmt.Errorf("AuthRepo - CreateUser - r.Builder: %w", err), Err: logger.ErrorDatabase}
	}
	dbUser := entity.User{}

	row := r.Pool.QueryRow(ctx, sql, args...)
	if err = row.Scan(&dbUser.ID, &dbUser.Username, &dbUser.Email, &dbUser.CreatedAt); err != nil {
		if strings.HasPrefix(err.Error(), "ERROR: duplicate key value violates unique constraint") {
			return entity.User{}, logger.MyError{LogMsg: fmt.Errorf("AuthRepo - CreateUser - row.Scan: %w", err), Err: logger.ErrorDuplicate}
		}
		return entity.User{}, logger.MyError{LogMsg: fmt.Errorf("AuthRepo - CreateUser - row.Scan: %w", err), Err: logger.ErrorDatabase}
	}
	return dbUser, logger.MyError{}
}

func (r *AuthRepoImpl) GetUserByEmail(ctx context.Context, email string) (entity.User, logger.MyError) {
	sql, args, err := r.Builder.
		Select("id", "username", "email", "password", "created_at").
		From("users").
		Where("email = ?", email).
		ToSql()
	if err != nil {
		return entity.User{}, logger.MyError{LogMsg: fmt.Errorf("AuthRepo - GetUserByEmail - r.Builder: %w", err), Err: logger.ErrorDatabase}
	}

	row := r.Pool.QueryRow(ctx, sql, args...)
	var user entity.User
	if err = row.Scan(&user.ID, &user.Username, &user.Email, &user.Password, &user.CreatedAt); err != nil {
		return entity.User{}, logger.MyError{LogMsg: fmt.Errorf("AuthRepo - GetUserByEmail - row.Scan: %w", err), Err: logger.ErrorDatabase}
	}
	return user, logger.MyError{}
}
