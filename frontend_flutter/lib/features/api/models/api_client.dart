import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart' as g;
import 'package:get_it/get_it.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:to_do_go/core/user_session.dart';
import 'package:to_do_go/features/achievements/models/achievement_models.dart';
import 'package:to_do_go/features/api/models/achievement/transaction_models.dart';
import 'package:to_do_go/features/api/models/auth/transaction_models.dart';
import 'package:to_do_go/features/api/models/task/transaction_models.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';
import 'package:to_do_go/generated/l10n.dart';

//? MARK: Api Client
class ApiClient {
  late Dio dio;
  late UserSession userSession;

  ApiClient() {
    dio = Dio(BaseOptions(baseUrl: "http://${dotenv.env['IP_URL']}", connectTimeout: const Duration(seconds: 5), receiveTimeout: const Duration(seconds: 5), contentType: Headers.jsonContentType));
    userSession = GetIt.I.get<UserSession>();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await userSession.getToken();
        if (token != null && token.isNotEmpty) {
          if (JwtDecoder.isExpired(token)) {
            String? tokenRefresh = await userSession.getTokenRefresh();
            userSession.clearToken();
            if (tokenRefresh != null && tokenRefresh.isNotEmpty) {
              var response = await refreshToken(tokenRefresh);
              if (response != null) {
                await userSession.setToken(response['token']);
                await userSession.setTokenRefresh(response['newRefreshToken']);
                token = response.token;
              } else {
                userSession.clear();
              }
            }
          }
          options.headers['Authorization'] = token;
        }
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        try {
          var newToken = response.data['accessToken'];
          if (newToken != null && newToken.isNotEmpty) {
            await userSession.setToken(newToken);
          }
        } catch (e) {
          if (e.toString() == "type 'String' is not a subtype of type 'int' of 'index'") {
            log("", name: "log: onResponse");
          } else {
            log(e.toString(), error: e, name: "log: onResponse", stackTrace: StackTrace.current, zone: Zone.current);
          }
        }
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        // if (e.response != null && e.response!.statusCode == 401) {
        //   userSession.clear();
        // }
        return handler.next(e);
      },
    ));
  }

  //? MARK: Auth
  Future<bool> login({required String email, required String password}) async {
    final Response response;
    try {
      response = await dio.post("/auth/login", data: PostLoginRequestModel(email: email, password: password).toJson());
      if (response.statusCode == 200) {
        await userSession.setToken(response.data['accessToken']);
        await userSession.setTokenRefresh(response.data['refreshToken']);
        await userSession.setActiveUser(GetUserResponseModel.fromJson(response.data["user"]).toUser().toJsonString());
        await userSession.getActiveUser();
        userSession.activeUser = GetUserResponseModel.fromJson(response.data["user"]).toUser();
        userSession.update();
        return true;
      }
    } catch (e) {
      g.Get.snackbar(S.current.error, "${S.current.loginError}: ${e.toString()}");
      log(e.toString(), error: e, name: "log: login", stackTrace: StackTrace.current, zone: Zone.current);
    }
    userSession.clear();
    userSession.update();
    return false;
  }

  Future<bool> register({required String email, required String password, required String username}) async {
    try {
      final Response response = await dio.post("/auth/register", data: PostRegisterRequestModel(email: email, password: password, username: username).toJson());
      if (response.statusCode != null && response.statusCode == 201) {
        userSession.activeUser = GetUserResponseModel.fromJson(response.data).toUser();
        userSession.update();
        return true;
      }
    } catch (e) {
      log(e.toString(), error: e, name: "log: register", stackTrace: StackTrace.current, zone: Zone.current);
    }
    userSession.clear();
    userSession.update();
    return false;
  }

  //? MARK: Task
  Future<List<Task>?> fetchTasks() async {
    try {
      final Response response = await dio.get("/tasks");
      if ((response.data['tasks'] as List).isNotEmpty) {
        return (response.data['tasks'] as List).map((e) {
          return GetTaskResponseModel.fromJson(e).toTask();
        }).toList();
      }
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: fetchTasks", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return null;
  }

  Stream<List<Task>> watchTasks() {
    try {
      return dio.get("/tasks").asStream().map((response) {
        return (response.data as List).map((e) => GetTaskResponseModel.fromJson(e).toTask()).toList();
      });
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: watch", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return Stream.empty();
  }

  Future<bool> addTask(Task task) async {
    try {
      final Response response = await dio.post("/tasks", data: PostTaskRequestModel.fromTask(task).toJson());
      return response.statusCode == 201;
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: addTask", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Future<bool> removeTask(Task task) async {
    try {
      final Response response = await dio.delete("/tasks/${task.id}");
      return response.statusCode == 200;
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: removeTask", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Future<bool> updateTask(Task task) async {
    try {
      final Response response = await dio.patch("/tasks/${task.id}", data: UpdateTaskRequestModel.fromTask(task).toJson());
      return response.statusCode == 200;
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: updateTask", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Future<List<Task>> fetchAiTasks(String transcriptions) async {
    try {
      final Response response = await dio.post("/tasks/ai-prompt", data: {"transcription": transcriptions});
      return (response.data as List).map((e) => GetAiTasksResponseModel.fromJson(e).toTask()).toList();
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: fetchAiTasks", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return [];
  }

  //? MARK: Achievement
  Future<List<Achievement>> fetchAchievements() async {
    try {
      return await dio.get("/achievements").then((response) {
        return (response.data as List).map((e) => GetAchievementResponseModel.fromJson(e).toAchievement()).toList();
      });
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: fetchAchievments", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return [];
  }

  Stream<List<Achievement>> watchAchievements() {
    try {
      return dio.get("/achievements").asStream().map((response) {
        return (response.data as List).map((e) => GetAchievementResponseModel.fromJson(e).toAchievement()).toList();
      });
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: watchAchievements", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return Stream.empty();
  }

  //? MARK: UserAchievement
  Future<List<UserAchievement>> fetchUserAchievements() async {
    try {
      return await dio.get("/user-achievements").then((response) {
        return (response.data as List).map((e) => GetUserAchievementResponseModel.fromJson(e).toUserAchievement()).toList();
      });
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: fetchUserAchievements", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return [];
  }

  Stream<List<UserAchievement>> watchUserAchievements() {
    try {
      return dio.get("/user-achievements").asStream().map((response) {
        return (response.data as List).map((e) => GetUserAchievementResponseModel.fromJson(e).toUserAchievement()).toList();
      });
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: watchUserAchievements", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return Stream.empty();
  }

  Future<bool> addUserAchievement(UserAchievement userAchievement) async {
    try {
      final Response response = await dio.post("/user-achievements", data: PostUserAchievementRequestModel.fromUserAchievement(userAchievement).toJson());
      return response.statusCode == 201;
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: addUserAchievement", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Future<bool> removeUserAchievement(UserAchievement userAchievement) async {
    try {
      final Response response = await dio.delete("/user-achievements/${userAchievement.id}");
      return response.statusCode == 200;
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: removeUserAchievement", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Future refreshToken(String refreshToken) async {
    try {
      final Response response = await dio.post("/auth/refresh", data: {"refreshToken": refreshToken});
      if (response.statusCode == 200) {
        return {"token": response.data['accessToken'], "newRefreshToken": response.data['refreshToken']};
      }
    } catch (e) {
      log(e.toString(), error: e, name: "log: Api: refreshToken", stackTrace: StackTrace.current, zone: Zone.current);
    }
  }
}
