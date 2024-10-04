// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get_it/get_it.dart';
// import 'package:to_do_go/core/user_session.dart';
// import 'package:to_do_go/features/auth-profile/models/user_models.dart';

// class UserSessionController extends GetxController {
//   final UserSession userSession = GetIt.I.get<UserSession>();
//   var isAuthenticated = false.obs; // Reactive variable for session status
//   bool isFirstTime = true;
//   User? activeUser;

//   @override
//   void onInit() {
//     super.onInit();
//     _init();
//   }

//   void _init() async {
//     isFirstTime = await userSession.getIsFirstTime();
//     isAuthenticated.value = await userSession.getToken() != null;
//   }
// }
