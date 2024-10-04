import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:to_do_go/core/routing/routing_middleware.dart';
import 'package:to_do_go/core/screens/main_screen.dart';
import 'package:to_do_go/features/auth-profile/screens/auth_screen.dart';
import 'package:to_do_go/features/auth-profile/screens/login_screen.dart';
import 'package:to_do_go/features/auth-profile/screens/registration_screen.dart';
import 'package:to_do_go/features/on-boarding/on_boarding_screen.dart';
import 'package:to_do_go/features/todo-list/presentation/screens/ai-task/ai_task_list_screen.dart';
import 'package:to_do_go/features/todo-list/presentation/screens/ai-task/ai_task_screen.dart';
import 'package:to_do_go/features/todo-list/presentation/screens/task_info_screen.dart';

List<GetPage<dynamic>> pages = [
  GetPage(name: "/onboarding", page: () => OnBoardingScreen(), middlewares: [RoutingMiddleware(priority: 1)]),
  GetPage(name: "/auth", page: () => const AuthScreen()),
  GetPage(name: "/auth/registration", page: () => RegistrationScreen()),
  GetPage(name: "/auth/login", page: () => LoginScreen()),
  GetPage(name: "/", page: () => MainScreen()),
  GetPage(name: "/add-task", page: () => TaskInfoScreen()),
  GetPage(name: "/add-task-ai", page: () => AddTaskAIScreen()),
  GetPage(name: "/add-task-ai/list", page: () => AddTaskAIListScreen()),
  GetPage(name: "/task", page: () => TaskInfoScreen()),
  GetPage(name: "/achievements", page: () => MainScreen(page: MainScreens.ACHIEVEMENTS)),
  GetPage(name: "/profile", page: () => MainScreen(page: MainScreens.PROFILE)),
];

GetPage<dynamic> unknownRoute = GetPage(
    name: "/not-found",
    page: () => const Scaffold(
          body: Text("Unknown Screen"),
        ));

String initialRoute = "/onboarding";
// String initialRoute = "/";

enum MainScreens { HOME, ACHIEVEMENTS, PROFILE }
