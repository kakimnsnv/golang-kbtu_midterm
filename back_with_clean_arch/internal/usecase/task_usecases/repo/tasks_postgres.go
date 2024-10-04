package repo

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v4"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/entity"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/postgres"
)

type TasksRepo struct {
	*postgres.Postgres
}

func New(pg *postgres.Postgres) *TasksRepo {
	return &TasksRepo{pg}
}

func (r *TasksRepo) CheckTaskOwnerByUserId(ctx context.Context, userId string, taskId string) (bool, logger.MyError) {
	sql, args, err := r.Builder.
		Select("1").
		From("tasks").
		Where("user_id = ? AND id = ?", userId, taskId).
		Limit(1).
		ToSql()

	if err != nil {
		return false, logger.MyError{LogMsg: fmt.Errorf("TasksRepo - CheckTaskOwnerByUserId - r.Builder: %w", err), Err: logger.ErrorDatabase}
	}

	row := r.Pool.QueryRow(ctx, sql, args...)
	var result int
	if err := row.Scan(&result); err != nil {
		if err == pgx.ErrNoRows {
			return false, logger.MyError{}
		}
		return false, logger.MyError{LogMsg: fmt.Errorf("TasksRepo - CheckTaskOwnerByUserId - row.Scan: %w", err), Err: logger.ErrorDatabase}
	}

	return true, logger.MyError{}
}

func (r *TasksRepo) GetTasks(ctx context.Context, userId string) ([]entity.Task, logger.MyError) {
	sql, _, err := r.Builder.
		Select("id", "name", "notes", "task_order", "status", "start_time", "end_time", "user_id", "priority", "created_date", "updated_date").
		From("tasks").
		Where("user_id = '" + userId + "'").
		ToSql()
	if err != nil {
		return nil, logger.MyError{LogMsg: fmt.Errorf("TasksRepo - GetTasks - r.Builder: %w", err), Err: logger.ErrorDatabase}
	}

	rows, err := r.Pool.Query(ctx, sql)
	if err != nil {
		if err.Error() == "expected 1 arguments, got 0" {
			return []entity.Task{}, logger.MyError{}
		}
		return nil, logger.MyError{LogMsg: fmt.Errorf("TasksRepo - GetTasks - r.Pool.Query: %w", err), Err: logger.ErrorDatabase}
	}
	defer rows.Close()

	entities := make([]entity.Task, 0)

	for rows.Next() {
		e := entity.Task{}

		err = rows.Scan(&e.ID, &e.Name, &e.Notes, &e.Order, &e.Status, &e.StartTime, &e.EndTime, &e.UserID, &e.Priority, &e.CreatedDate, &e.UpdatedDate)
		if err != nil {
			return nil, logger.MyError{LogMsg: fmt.Errorf("TasksRepo - GetTasks - rows.Scan: %w", err), Err: logger.ErrorDatabase}
		}

		entities = append(entities, e)
	}

	return entities, logger.MyError{}
}

func (r *TasksRepo) InsertTask(ctx context.Context, t entity.Task) logger.MyError {
	sql, args, err := r.Builder.
		Insert("tasks").
		Columns("name", "task_order", "start_time", "end_time", "priority", "user_id").
		Values(t.Name, t.Order, t.StartTime, t.EndTime, t.Priority, t.UserID).
		Suffix("RETURNING id"). //TODO: to return the id of the inserted task
		ToSql()
	if err != nil {
		return logger.MyError{LogMsg: fmt.Errorf("TasksRepo - InsertTask - r.Builder: %w", err), Err: logger.ErrorDatabase}
	}

	_, err = r.Pool.Exec(ctx, sql, args...)
	if err != nil {
		return logger.MyError{LogMsg: fmt.Errorf("TasksRepo - InsertTask - r.Pool.Exec: %w", err), Err: logger.ErrorDatabase}
	}

	return logger.MyError{}
}

func (r *TasksRepo) UpdateTask(ctx context.Context, t entity.Task) logger.MyError {
	sql, args, err := r.Builder.
		Update("tasks").
		Set("name", t.Name).
		Set("start_time", t.StartTime).
		Set("end_time", t.EndTime).
		Set("priority", t.Priority).
		Set("status", t.Status).
		Set("task_order", t.Order).
		Where("id = ?", t.ID).
		ToSql()
	if err != nil {
		return logger.MyError{LogMsg: fmt.Errorf("TasksRepo - UpdateTask - r.Builder: %w", err), Err: logger.ErrorDatabase}
	}

	_, err = r.Pool.Exec(ctx, sql, args...)
	if err != nil {
		return logger.MyError{LogMsg: fmt.Errorf("TasksRepo - UpdateTask - r.Pool.Exec: %w", err), Err: logger.ErrorDatabase}
	}

	return logger.MyError{}
}

func (r *TasksRepo) DeleteTask(ctx context.Context, taskId string) logger.MyError {
	sql, args, err := r.Builder.
		Delete("tasks").
		Where("id = ?", taskId).
		ToSql()
	if err != nil {
		return logger.MyError{LogMsg: fmt.Errorf("TasksRepo - DeleteTask - r.Builder: %w", err), Err: logger.ErrorDatabase}
	}

	_, err = r.Pool.Exec(ctx, sql, args...)
	if err != nil {
		return logger.MyError{LogMsg: fmt.Errorf("TasksRepo - DeleteTask - r.Pool.Exec: %w", err), Err: logger.ErrorDatabase}
	}

	return logger.MyError{}
}
