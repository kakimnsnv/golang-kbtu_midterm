package routes

import (
	"encoding/json"
	"net/http"
	"time"

	"github.com/gorilla/mux"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/controller/http/v1/api_errors"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/controller/http/v1/middlewares"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/entity"
	usecase "github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/usecase/task_usecases"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
)

type tasksRoutes struct {
	t usecase.Tasks
	l logger.Interface
}

func NewTasksRoutes(router *mux.Router, t usecase.Tasks, l logger.Interface) {
	r := tasksRoutes{t, l}

	h := router.PathPrefix("/tasks").Subrouter()
	{
		h.Use(middlewares.AuthMiddleware(l))
		h.HandleFunc("", r.getTasks).Methods("GET")
		h.HandleFunc("", r.createTask).Methods("POST")
		h.HandleFunc("/{id}", r.updateTask).Methods("PUT")
		h.HandleFunc("/{id}", r.deleteTask).Methods("DELETE")
	}
}

type tasksResponse struct {
	Tasks []entity.Task `json:"tasks"`
}

type taskPostRequest struct {
	Name      string    `json:"name" example:"Task 1"`
	Order     int       `json:"order" example:"0"`
	StartTime time.Time `json:"startTime" example:"2021-10-10T10:00:00Z"`
	EndTime   time.Time `json:"endTime" example:"2021-10-10T10:00:00Z"`
	Priority  int       `json:"priority" example:"0"`
}

type taskPutRequest struct {
	Name      string    `json:"name" example:"Task 1"`
	Order     int       `json:"order" example:"0"`
	StartTime time.Time `json:"startTime" example:"2021-10-10T10:00:00Z"`
	EndTime   time.Time `json:"endTime" example:"2021-10-10T10:00:00Z"`
	Priority  int       `json:"priority" example:"0"`
	Status    int       `json:"status" example:"0"`
}

// @Summary Get tasks
// @Description should return all tasks
// @Tags tasks
// @Accept json
// @Produce json
// @Success 200 {object} tasksResponse
// @Security ApiKeyAuth
// @Router /v1/tasks [get]
func (r tasksRoutes) getTasks(w http.ResponseWriter, req *http.Request) {
	userId := middlewares.GetUserIDFromContext(req.Context())
	tasks, err := r.t.GetTasks(req.Context(), userId)
	if err.Err != nil {
		r.l.Error(err, "http - v1 - tasksRoutes - getTasks")
		api_errors.ErrorResponse(w, http.StatusInternalServerError, "database error")

		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(tasksResponse{tasks})
}

// @Summary Create task
// @Description should create a task
// @Tags tasks
// @Accept json
// @Produce json
// @Param task body taskPostRequest true "Task object"
// @Security ApiKeyAuth
// @Success 201
// @Router /v1/tasks [post]
func (r tasksRoutes) createTask(w http.ResponseWriter, req *http.Request) {
	var t entity.Task
	if err := json.NewDecoder(req.Body).Decode(&t); err != nil {
		r.l.Error(err, "http - v1 - tasksRoutes - createTask")
		api_errors.ErrorResponse(w, http.StatusBadRequest, "invalid request body")

		return
	}

	userId := middlewares.GetUserIDFromContext(req.Context())

	t.UserID = userId

	if err := r.t.InsertTask(req.Context(), t); err.Err != nil {
		r.l.Error(err, "http - v1 - tasksRoutes - createTask")
		api_errors.ErrorResponse(w, http.StatusInternalServerError, "database error")

		return
	}

	w.WriteHeader(http.StatusCreated)
}

// @Summary Update task
// @Description should update a task
// @Tags tasks
// @Accept json
// @Produce json
// @Param id path string true "Task ID"
// @Param task body taskPutRequest true "Task object"
// @Security ApiKeyAuth
// @Success 200
// @Router /v1/tasks/{id} [put]
func (r tasksRoutes) updateTask(w http.ResponseWriter, req *http.Request) {
	var t entity.Task
	if err := json.NewDecoder(req.Body).Decode(&t); err != nil {
		r.l.Error(err, "http - v1 - tasksRoutes - updateTask")
		api_errors.ErrorResponse(w, http.StatusBadRequest, "invalid request body")

		return
	}

	t.ID = mux.Vars(req)["id"]
	userId := middlewares.GetUserIDFromContext(req.Context())

	isOwner, err := r.t.CheckTaskOwnerByUserId(req.Context(), userId, t.ID)
	if err.Err != nil {
		r.l.Error(err, "http - v1 - tasksRoutes - deleteTask - r.t.CheckTaskOwnerByUserId")
		api_errors.ErrorResponse(w, http.StatusInternalServerError, "database error")
		return
	}

	if !isOwner {
		api_errors.ErrorResponse(w, http.StatusNotAcceptable, "User does not have such task in the database")
		return
	}

	if err := r.t.UpdateTask(req.Context(), t); err.Err != nil {
		r.l.Error(err, "http - v1 - tasksRoutes - updateTask")
		api_errors.ErrorResponse(w, http.StatusInternalServerError, "database error")

		return
	}

	w.WriteHeader(http.StatusOK)
}

// @Summary Delete task
// @Description should delete a task
// @Tags tasks
// @Param id path string true "Task ID"
// @Security ApiKeyAuth
// @Success 200
// @Router /v1/tasks/{id} [delete]
func (r tasksRoutes) deleteTask(w http.ResponseWriter, req *http.Request) {
	id := mux.Vars(req)["id"]

	userId := middlewares.GetUserIDFromContext(req.Context())

	isOwner, err := r.t.CheckTaskOwnerByUserId(req.Context(), userId, id)
	if err.Err != nil {
		r.l.Error(err, "http - v1 - tasksRoutes - deleteTask - r.t.CheckTaskOwnerByUserId")
		api_errors.ErrorResponse(w, http.StatusInternalServerError, "database error")
		return
	}

	if !isOwner {
		api_errors.ErrorResponse(w, http.StatusNotAcceptable, "User does not have such task in the database")
		return
	}

	if err := r.t.DeleteTask(req.Context(), id); err.Err != nil {
		r.l.Error(err, "http - v1 - tasksRoutes - deleteTask")
		api_errors.ErrorResponse(w, http.StatusInternalServerError, "database error")

		return
	}

	w.WriteHeader(http.StatusOK)
}
