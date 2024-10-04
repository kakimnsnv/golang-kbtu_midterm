package v1

import (
	"fmt"
	"net/http"

	"github.com/gorilla/handlers"
	"github.com/gorilla/mux"
	_ "github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/docs"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/controller/http/v1/routes"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/usecase/auth_usecases"
	task_usecases "github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/usecase/task_usecases"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
	httpSwagger "github.com/swaggo/http-swagger/v2"
)

//? Swagger spec:
// @title Tasks API
// @version 1.0
// @description This is a simple tasks API

// @contact.name Kakimbek Nyssanov
// @contact.url t.me/kakimnsnv
// @contact.email k_nyssanov@kbtu.kz

// @host localhost:8080
// @BasePath /
// @schemes http

// @securityDefinitions.apiKey ApiKeyAuth
// @in header
// @name Authorization
func NewRouter(router *mux.Router, l logger.Interface, t task_usecases.Tasks, a auth_usecases.Auth, port string) {
	router.Use(LoggerMiddleware(l))
	router.Use(handlers.RecoveryHandler())

	router.PathPrefix("/swagger").Handler(httpSwagger.Handler(
		httpSwagger.URL(fmt.Sprintf("http://localhost:%s/swagger/doc.json", port)),
		httpSwagger.DeepLinking(true),
		httpSwagger.DocExpansion("none"),
		httpSwagger.DomID("swagger-ui"),
	)).Methods(http.MethodGet)

	v1 := router.PathPrefix("/v1").Subrouter()
	{
		// TODO: add UserRoutes
		routes.NewAuthRoutes(v1, a, l)
		routes.NewTasksRoutes(v1, t, l)
	}

}

func LoggerMiddleware(l logger.Interface) mux.MiddlewareFunc {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			l.Info("request received", "method", r.Method, "url", r.URL.Path)
			next.ServeHTTP(w, r)
		})
	}
}
