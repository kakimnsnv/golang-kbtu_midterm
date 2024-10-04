package entity

import "time"

type User struct {
	ID        string    `json:"id" example:"1"`
	Email     string    `json:"email" example:"example@xyz.xyz"`
	Username  string    `json:"username" example:"John Doe"`
	Password  string    `json:"password" example:"Password@123"`
	CreatedAt time.Time `json:"created_at" example:"2021-10-10T10:00:00Z"`
}

type AuthResponse struct {
	Token        string `json:"accessToken"`
	RefreshToken string `json:"refreshToken"`
	User         User   `json:"user"`
}
