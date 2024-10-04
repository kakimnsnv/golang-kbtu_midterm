package app

import (
	"fmt"
	"os"
	"os/signal"
	"syscall"

	"github.com/gorilla/mux"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/config"
	v1 "github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/controller/http/v1"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/usecase/auth_usecases"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/usecase/task_usecases"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/usecase/task_usecases/repo"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/httpserver"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/postgres"
)

func Run(cfg *config.Config) {
	l := logger.New(cfg.Log.Level)

	// Repository
	pg, err := postgres.New(cfg.PG.URL, postgres.MaxPoolSize(cfg.PG.PoolMax))
	if err != nil {
		l.Fatal(fmt.Errorf("app - Run - postgres.New: %w", err))
	}
	defer pg.Close()

	// Use case
	tasksUseCase := task_usecases.New(repo.New(pg))
	authUseCase := auth_usecases.NewAuthUseCase(auth_usecases.NewAuthRepo(pg))

	// HTTP Server
	router := mux.NewRouter()
	v1.NewRouter(router, l, tasksUseCase, authUseCase, cfg.HTTP.Port)
	httpServer := httpserver.New(router, httpserver.Port(cfg.HTTP.Port))

	interrupt := make(chan os.Signal, 1)
	signal.Notify(interrupt, os.Interrupt, syscall.SIGTERM) //TODO: learn more about signals

	select { // TODO: learn about select
	case s := <-interrupt:
		l.Info("app - Run - signal received: " + s.String())
	case err := <-httpServer.Notify():
		l.Error(fmt.Errorf("app - Run - httpServer.Notify: %w", err))
	}

	err = httpServer.Shutdown()
	if err != nil {
		l.Error(fmt.Errorf("app - Run - httpServer.Shutdown: %w", err))
	}
}
