package middlewares

import (
	"context"
	"net/http"

	"github.com/gorilla/mux"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/auth"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
)

type contextKey string

const userCtxKey contextKey = "userId"

func AuthMiddleware(l logger.Interface) mux.MiddlewareFunc {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			authHeader := r.Header.Get("Authorization")
			if authHeader == "" {
				http.Error(w, "missing token", http.StatusBadRequest)
				return
			}

			claims, err := auth.ValidateJWT(authHeader)
			if err != nil {
				l.Error(err, "http - v1 - AuthMiddleware:")
				http.Error(w, "Invalid token", http.StatusUnauthorized)
				return
			}
			ctx := context.WithValue(r.Context(), userCtxKey, claims.UserID)
			next.ServeHTTP(w, r.WithContext(ctx))

		})
	}
}

func GetUserIDFromContext(ctx context.Context) string {
	userID, ok := ctx.Value(userCtxKey).(string)
	if !ok {
		return ""
	}
	return userID
}
