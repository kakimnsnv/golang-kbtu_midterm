### KBTU Golang course midterm application with golang and flutter

# To Run backend
``` shell
cd back_with_clean_arch 
#create .env file accourding to .env.example 
make compose-up
# exit with ctrl + c
make migrate-up 
make run
# to stop ctrl + c
# to revert things and shutdown container and delete its volume run following:
make compose-down
make docker-rm-volume
```

# To run frontend
``` shell
cd frontend_flutter
flutter run
```
