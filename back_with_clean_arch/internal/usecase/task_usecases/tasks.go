package task_usecases

import (
	"context"
	"fmt"

	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/entity"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
)

type TasksUseCase struct {
	repo TasksRepo
}

func New(repo TasksRepo) *TasksUseCase {
	return &TasksUseCase{repo}
}

func (uc *TasksUseCase) CheckTaskOwnerByUserId(ctx context.Context, userId string, taskId string) (bool, logger.MyError) {
	belongsToUser, err := uc.repo.CheckTaskOwnerByUserId(ctx, userId, taskId)
	if err.Err != nil {
		return false, logger.MyError{LogMsg: fmt.Errorf("TasksUseCase - CheckTaskOwnerByUserId - uc.repo.CheckTaskOwnerById: %w", err.LogMsg), Err: err.Err}
	}
	return belongsToUser, logger.MyError{}
}

func (uc *TasksUseCase) GetTasks(ctx context.Context, userId string) ([]entity.Task, logger.MyError) {
	tasks, err := uc.repo.GetTasks(ctx, userId)
	if err.Err != nil {
		return nil, logger.MyError{LogMsg: fmt.Errorf("TasksUseCase - GetTasks - uc.repo.GetTasks: %w", err.LogMsg), Err: err.Err}
	}

	return tasks, logger.MyError{}
}

func (uc *TasksUseCase) InsertTask(ctx context.Context, t entity.Task) logger.MyError {
	err := uc.repo.InsertTask(ctx, t)
	if err.Err != nil {
		return logger.MyError{LogMsg: fmt.Errorf("TasksUseCase - InsertTask - uc.repo.InsertTask: %w", err.LogMsg), Err: err.Err}
	}

	return logger.MyError{}
}

func (uc *TasksUseCase) UpdateTask(ctx context.Context, t entity.Task) logger.MyError {
	err := uc.repo.UpdateTask(ctx, t)
	if err.Err != nil {
		return logger.MyError{LogMsg: fmt.Errorf("TasksUseCase - UpdateTask - uc.repo.UpdateTask: %w", err.LogMsg), Err: err.Err}
	}

	return logger.MyError{}
}

func (uc *TasksUseCase) DeleteTask(ctx context.Context, taskId string) logger.MyError {
	err := uc.repo.DeleteTask(ctx, taskId)
	if err.Err != nil {
		return logger.MyError{LogMsg: fmt.Errorf("TasksUseCase - DeleteTask - uc.repo.DeleteTask: %w", err.LogMsg), Err: err.Err}
	}

	return logger.MyError{}
}
