package task_usecases

import (
	"context"

	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/entity"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
)

type (
	Tasks interface {
		CheckTaskOwnerByUserId(ctx context.Context, userId string, taskId string) (bool, logger.MyError)
		GetTasks(ctx context.Context, userId string) ([]entity.Task, logger.MyError)
		InsertTask(ctx context.Context, t entity.Task) logger.MyError
		UpdateTask(ctx context.Context, t entity.Task) logger.MyError
		DeleteTask(ctx context.Context, taskId string) logger.MyError
	}

	TasksRepo interface {
		CheckTaskOwnerByUserId(ctx context.Context, userId string, taskId string) (bool, logger.MyError)
		GetTasks(ctx context.Context, userId string) ([]entity.Task, logger.MyError)
		InsertTask(ctx context.Context, t entity.Task) logger.MyError
		UpdateTask(ctx context.Context, t entity.Task) logger.MyError
		DeleteTask(ctx context.Context, taskId string) logger.MyError
	}
)
