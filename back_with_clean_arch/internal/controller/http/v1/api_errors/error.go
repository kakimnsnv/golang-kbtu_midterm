package api_errors

import (
	"encoding/json"
	"net/http"
)

type response struct {
	Error string `json:"error" example:"error message"`
}

func ErrorResponse(w http.ResponseWriter, code int, msg string) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(code)
	json.NewEncoder(w).Encode(response{msg})
}
