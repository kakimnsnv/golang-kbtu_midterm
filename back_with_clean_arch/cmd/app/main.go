package main

import (
	"log"

	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/config"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/app"
)

func main() {
	cfg, err := config.NewConfig()
	if err != nil {
		log.Fatalf("Config error: %s", err)
	}

	app.Run(cfg)
}
