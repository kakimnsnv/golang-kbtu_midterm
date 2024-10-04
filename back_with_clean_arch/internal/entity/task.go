package entity

import "time"

type Task struct {
	ID          string    `json:"id" example:"1"`
	CreatedDate time.Time `json:"createdDate" example:"2021-10-10T10:00:00Z"`
	UpdatedDate time.Time `json:"updatedDate" example:"2021-10-10T10:00:00Z"`
	Name        string    `json:"name" example:"Task 1"`
	Notes       string    `json:"notes" example:"Description of task 1"`
	Order       int       `json:"order" example:"1"`
	Status      int       `json:"status" example:"0" enum:"0, 1, 2, 3"`
	StartTime   time.Time `json:"startTime" example:"2021-10-10T10:00:00Z"`
	EndTime     time.Time `json:"endTime" example:"2021-10-10T10:00:00Z"`
	UserID      string    `json:"userId" example:"47e0ae97-b63a-4d92-8a03-7e99b4cc99cd"`
	Priority    int       `json:"priority" example:"1" enum:"0, 1, 2"`
}
