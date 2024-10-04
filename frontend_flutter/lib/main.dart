import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_go/core/routing/get_router.dart';
import 'package:to_do_go/core/theme/theme.dart';
import 'package:to_do_go/core/user_session.dart';
import 'package:to_do_go/features/achievements/achievements_controller.dart';
import 'package:to_do_go/features/api/models/api_client.dart';
import 'package:to_do_go/features/local-storage/drift/drift_db.dart';
import 'package:to_do_go/features/todo-list/controllers/tasks_controller_interface.dart';
import 'package:to_do_go/features/todo-list/controllers/task_list_controller.dart';
import 'package:to_do_go/features/todo-list/task_repository.dart';
import 'package:to_do_go/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  await dotenv.load();

  GetIt.I.registerSingleton<LocalDatabase>(LocalDatabase());
  GetIt.I.registerSingleton<UserSession>(UserSession());
  GetIt.I.registerSingleton<ApiClient>(ApiClient());

  Get.config(enableLog: false);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) {
        return GetMaterialApp(
          initialBinding: BindingsBuilder(
            () {
              Get.put<TaskRepositoryImpl>(
                  TaskRepositoryImpl(
                    localDB: GetIt.I.get<LocalDatabase>(),
                    apiClient: GetIt.I.get<ApiClient>(),
                  ),
                  permanent: true);
              Get.put(TasksControllerMixin(), permanent: true);
              Get.lazyPut(() => TaskListController(), fenix: true);
              Get.put(AchievementsController(), permanent: true);
            },
          ),
          enableLog: false,
          theme: TDGTheme.lightTheme,
          // darkTheme: TDGTheme.darkTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale("ru"),
          initialRoute: initialRoute,
          unknownRoute: unknownRoute,
          getPages: pages,
        );
      },
    );
  }
}
