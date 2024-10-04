import 'dart:async';
import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_go/features/auth-profile/models/user_models.dart';

class UserSession extends GetxController {
  static final String keyToken = "${dotenv.env['APPLICATION_ID']}_key_token";
  static final String keyTokenRefresh = "${dotenv.env['APPLICATION_ID']}_key_token_refresh";
  static final String keyIsFirstTime = "${dotenv.env['APPLICATION_ID']}_is_first_time";
  static final String keyUser = "${dotenv.env['APPLICATION_ID']}_user";

  RxBool isAuthenticated = false.obs; // Reactive variable for session status
  RxBool isFirstTimeVar = true.obs;
  User? activeUser;
  final StreamController<bool> _statusController = StreamController<bool>();

  UserSession() {
    _init();
  }

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> getActiveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(keyUser) != null) {
      activeUser = User.fromString(prefs.getString(keyUser)!);
    } else {
      activeUser = null;
    }
  }

  Future<void> setActiveUser(String userJson) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyUser, userJson);
  }

  void _init() async {
    await getIsFirstTime().then((value) {
      isFirstTimeVar.value = value;
    });

    await getActiveUser();

    await getToken().then((value) {
      isAuthenticated.value = value != null;
    });
  }

  Future<void> get isFirstTime async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTimeVar.value = prefs.getBool(keyIsFirstTime) ?? true;
  }

  Future<bool> setFirstTime(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(keyIsFirstTime, value);
  }

  Future<bool> getIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsFirstTime) ?? true;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return _getOriginalToken(prefs.getString(keyToken));
  }

  Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyToken, _modifyToken(token));
    _statusController.add(true);
  }

  Future<void> setTokenRefresh(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyTokenRefresh, _modifyToken(value));
  }

  Future<String?> getTokenRefresh() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return _getOriginalToken(prefs.getString(keyTokenRefresh));
  }

  String _modifyToken(String originalToken) {
    originalToken += randomString;
    return originalToken;
  }

  String _getOriginalToken(String? modifiedToken) {
    if (modifiedToken == null || modifiedToken.isEmpty) return '';
    return modifiedToken.substring(0, modifiedToken.length - 6);
  }

  String get randomString {
    const allowedCharacters = '0123456789qwertyuiopasdfghjklzxcvbnm';
    final random = Random();
    return List.generate(6, (index) => allowedCharacters[random.nextInt(allowedCharacters.length)]).join();
  }

  Future clear() async {
    await SharedPreferences.getInstance().then((prefs) {
      prefs.remove(keyToken);
      prefs.remove(keyTokenRefresh);
      prefs.remove(keyUser);
      prefs.remove(keyIsFirstTime);
      activeUser = null;
      _statusController.add(false);
    });
  }

  Future clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(keyToken);
    prefs.remove(keyTokenRefresh);
  }

  Stream<bool> get isSessionOpen async* {
    yield* _statusController.stream;
  }
}
