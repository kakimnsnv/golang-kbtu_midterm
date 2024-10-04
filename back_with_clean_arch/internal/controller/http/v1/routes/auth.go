package routes

import (
	"encoding/json"
	"net/http"

	"github.com/gorilla/mux"
	usecase "github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/internal/usecase/auth_usecases"
	"github.com/kakimnsnv/golang-kbtu/midterm/back_with_clean_arch/pkg/logger"
)

type authRoutes struct {
	u usecase.Auth
	l logger.Interface
}

func NewAuthRoutes(router *mux.Router, u usecase.Auth, l logger.Interface) {
	r := authRoutes{u, l}

	s := router.PathPrefix("/auth").Subrouter()
	{
		s.HandleFunc("/login", r.login).Methods("POST")
		s.HandleFunc("/register", r.register).Methods("POST")
	}
}

type loginRequest struct {
	Email    string `json:"email" example:"example@xyz.xyz"`
	Password string `json:"password" example:"Password@123"`
}

type registerRequest struct {
	Email    string `json:"email" example:"example@xyz.xyz"`
	Password string `json:"password" example:"Password@123"`
	Username string `json:"username" example:"example"`
}

// @Summary Login
// @Description Login
// @Tags auth
// @Accept json
// @Produce json
// @Param body body loginRequest true "Login request"
// @Success 200 {object} entity.AuthResponse
// @Failure 400 {string} string "invalid request"
// @Failure 401 {string} string "invalid email or password"
// @Router /v1/auth/login [post]
func (r authRoutes) login(w http.ResponseWriter, req *http.Request) {
	var loginReq loginRequest
	if err := json.NewDecoder(req.Body).Decode(&loginReq); err != nil {
		r.l.Error("authRoutes - login - json.NewDecoder.Decode", err)
		http.Error(w, "invalid request", http.StatusBadRequest)
		return
	}

	authResponse, err := r.u.Login(req.Context(), loginReq.Email, loginReq.Password)
	if err.Err != nil {
		r.l.Error("authRoutes - login - u.Login", err.LogMsg)
		http.Error(w, err.Err.Error(), http.StatusUnauthorized)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(authResponse)

}

// @Summary Register
// @Description Register
// @Tags auth
// @Accept json
// @Produce json
// @Param body body registerRequest true "Register request"
// @Success 201 {object} entity.AuthResponse
// @Failure 400 {string} string "invalid request"
// @Failure 500 {string} string "internal server error"
// @Router /v1/auth/register [post]
func (r authRoutes) register(w http.ResponseWriter, req *http.Request) {
	var registerReq registerRequest
	if err := json.NewDecoder(req.Body).Decode(&registerReq); err != nil {
		r.l.Error("authRoutes - register - json.NewDecoder.Decode: %w", err)
		http.Error(w, "invalid request", http.StatusBadRequest)
		return
	}

	authResponse, err := r.u.Register(req.Context(), registerReq.Email, registerReq.Password, registerReq.Username)
	if err.Err != nil {
		r.l.Error("authRoutes - register - u.Register", err.LogMsg)
		http.Error(w, err.Err.Error(), http.StatusInternalServerError)
		return
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(authResponse)
}
