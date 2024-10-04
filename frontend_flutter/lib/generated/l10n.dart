// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `To Do Go`
  String get toDoGo {
    return Intl.message(
      'To Do Go',
      name: 'toDoGo',
      desc: '',
      args: [],
    );
  }

  /// `next`
  String get next {
    return Intl.message(
      'next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `skip`
  String get skip {
    return Intl.message(
      'skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `onBoarding1`
  String get onBoarding1 {
    return Intl.message(
      'onBoarding1',
      name: 'onBoarding1',
      desc: '',
      args: [],
    );
  }

  /// `onBoarding1_1`
  String get onBoarding1_1 {
    return Intl.message(
      'onBoarding1_1',
      name: 'onBoarding1_1',
      desc: '',
      args: [],
    );
  }

  /// `onBoarding2`
  String get onBoarding2 {
    return Intl.message(
      'onBoarding2',
      name: 'onBoarding2',
      desc: '',
      args: [],
    );
  }

  /// `onBoarding2_1`
  String get onBoarding2_1 {
    return Intl.message(
      'onBoarding2_1',
      name: 'onBoarding2_1',
      desc: '',
      args: [],
    );
  }

  /// `onBoarding3`
  String get onBoarding3 {
    return Intl.message(
      'onBoarding3',
      name: 'onBoarding3',
      desc: '',
      args: [],
    );
  }

  /// `onBoarding3_1`
  String get onBoarding3_1 {
    return Intl.message(
      'onBoarding3_1',
      name: 'onBoarding3_1',
      desc: '',
      args: [],
    );
  }

  /// `Вы можете войти в систему через:`
  String get youCanSignInThrought {
    return Intl.message(
      'Вы можете войти в систему через:',
      name: 'youCanSignInThrought',
      desc: '',
      args: [],
    );
  }

  /// `Продолжая, вы принимаете `
  String get proceedingYouAgree {
    return Intl.message(
      'Продолжая, вы принимаете ',
      name: 'proceedingYouAgree',
      desc: '',
      args: [],
    );
  }

  /// `условия и предложения `
  String get proceedingYouAgree1 {
    return Intl.message(
      'условия и предложения ',
      name: 'proceedingYouAgree1',
      desc: '',
      args: [],
    );
  }

  /// `Войти через email`
  String get signInWithEmail {
    return Intl.message(
      'Войти через email',
      name: 'signInWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get apple {
    return Intl.message(
      'Apple',
      name: 'apple',
      desc: '',
      args: [],
    );
  }

  /// `Регистрация`
  String get registration {
    return Intl.message(
      'Регистрация',
      name: 'registration',
      desc: '',
      args: [],
    );
  }

  /// `Ваше ФИО`
  String get fullName {
    return Intl.message(
      'Ваше ФИО',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона`
  String get phoneNumber {
    return Intl.message(
      'Номер телефона',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Введите ваше ФИО`
  String get enterFullName {
    return Intl.message(
      'Введите ваше ФИО',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Введите номер телефона`
  String get enterPhoneNumber {
    return Intl.message(
      'Введите номер телефона',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Ваше ФИО`
  String get email {
    return Intl.message(
      'Ваше ФИО',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Номер телефона`
  String get password {
    return Intl.message(
      'Номер телефона',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Введите ваше ФИО`
  String get confirmPassword {
    return Intl.message(
      'Введите ваше ФИО',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Введите номер телефона`
  String get enterEmail {
    return Intl.message(
      'Введите номер телефона',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Введите номер телефона`
  String get enterPassword {
    return Intl.message(
      'Введите номер телефона',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Введите номер телефона`
  String get enterConfimationPassword {
    return Intl.message(
      'Введите номер телефона',
      name: 'enterConfimationPassword',
      desc: '',
      args: [],
    );
  }

  /// `Зарегистрироваться`
  String get register {
    return Intl.message(
      'Зарегистрироваться',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `или`
  String get or {
    return Intl.message(
      'или',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `start`
  String get start {
    return Intl.message(
      'start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `tasksListEmpty`
  String get tasksListEmpty {
    return Intl.message(
      'tasksListEmpty',
      name: 'tasksListEmpty',
      desc: '',
      args: [],
    );
  }

  /// `addTaskManually`
  String get addTaskManually {
    return Intl.message(
      'addTaskManually',
      name: 'addTaskManually',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `achievement`
  String get achievement {
    return Intl.message(
      'achievement',
      name: 'achievement',
      desc: '',
      args: [],
    );
  }

  /// `share`
  String get share {
    return Intl.message(
      'share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get profile {
    return Intl.message(
      'profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `addTask`
  String get addTask {
    return Intl.message(
      'addTask',
      name: 'addTask',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `enterName`
  String get enterName {
    return Intl.message(
      'enterName',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `date`
  String get date {
    return Intl.message(
      'date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Вы уверены, что хотите удалить?`
  String get areYouSureYouWantToDelete {
    return Intl.message(
      'Вы уверены, что хотите удалить?',
      name: 'areYouSureYouWantToDelete',
      desc: '',
      args: [],
    );
  }

  /// `Да`
  String get yes {
    return Intl.message(
      'Да',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Нет`
  String get no {
    return Intl.message(
      'Нет',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get error {
    return Intl.message(
      'Ошибка',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка регистрации`
  String get registrationError {
    return Intl.message(
      'Ошибка регистрации',
      name: 'registrationError',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка входа`
  String get loginError {
    return Intl.message(
      'Ошибка входа',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `enterDate`
  String get enterDate {
    return Intl.message(
      'enterDate',
      name: 'enterDate',
      desc: '',
      args: [],
    );
  }

  /// `begining`
  String get begining {
    return Intl.message(
      'begining',
      name: 'begining',
      desc: '',
      args: [],
    );
  }

  /// `end`
  String get end {
    return Intl.message(
      'end',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `prioritet`
  String get prioritet {
    return Intl.message(
      'prioritet',
      name: 'prioritet',
      desc: '',
      args: [],
    );
  }

  /// `low`
  String get low {
    return Intl.message(
      'low',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `mid`
  String get mid {
    return Intl.message(
      'mid',
      name: 'mid',
      desc: '',
      args: [],
    );
  }

  /// `high`
  String get high {
    return Intl.message(
      'high',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `planningFinished`
  String get planningFinished {
    return Intl.message(
      'planningFinished',
      name: 'planningFinished',
      desc: '',
      args: [],
    );
  }

  /// `planningFinished_1`
  String get planningFinished_1 {
    return Intl.message(
      'planningFinished_1',
      name: 'planningFinished_1',
      desc: '',
      args: [],
    );
  }

  /// `addTaskByAI`
  String get addTaskByAI {
    return Intl.message(
      'addTaskByAI',
      name: 'addTaskByAI',
      desc: '',
      args: [],
    );
  }

  /// `hello`
  String get hello {
    return Intl.message(
      'hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `aiTaskAddQuestion`
  String get aiTaskAddQuestion {
    return Intl.message(
      'aiTaskAddQuestion',
      name: 'aiTaskAddQuestion',
      desc: '',
      args: [],
    );
  }

  /// `pressButtonAndSpeak`
  String get pressButtonAndSpeak {
    return Intl.message(
      'pressButtonAndSpeak',
      name: 'pressButtonAndSpeak',
      desc: '',
      args: [],
    );
  }

  /// `recordAgain`
  String get recordAgain {
    return Intl.message(
      'recordAgain',
      name: 'recordAgain',
      desc: '',
      args: [],
    );
  }

  /// `yourPlansFor {date}:`
  String yourPlansFor(DateTime date) {
    final DateFormat dateDateFormat =
        DateFormat('d MMMM', Intl.getCurrentLocale());
    final String dateString = dateDateFormat.format(date);

    return Intl.message(
      'yourPlansFor $dateString:',
      name: 'yourPlansFor',
      desc: '',
      args: [dateString],
    );
  }

  /// `checkAITasks`
  String get checkAITasks {
    return Intl.message(
      'checkAITasks',
      name: 'checkAITasks',
      desc: '',
      args: [],
    );
  }

  /// `thereMightBeADescription`
  String get thereMightBeADescription {
    return Intl.message(
      'thereMightBeADescription',
      name: 'thereMightBeADescription',
      desc: '',
      args: [],
    );
  }

  /// `addAllTasks`
  String get addAllTasks {
    return Intl.message(
      'addAllTasks',
      name: 'addAllTasks',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `edit`
  String get edit {
    return Intl.message(
      'edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `remove`
  String get remove {
    return Intl.message(
      'remove',
      name: 'remove',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `addedSuccessfully`
  String get addedSuccessfully {
    return Intl.message(
      'addedSuccessfully',
      name: 'addedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `editedSuccessfully`
  String get editedSuccessfully {
    return Intl.message(
      'editedSuccessfully',
      name: 'editedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `youCanAlwaysMakeChanges`
  String get youCanAlwaysMakeChanges {
    return Intl.message(
      'youCanAlwaysMakeChanges',
      name: 'youCanAlwaysMakeChanges',
      desc: '',
      args: [],
    );
  }

  /// `removed`
  String get removed {
    return Intl.message(
      'removed',
      name: 'removed',
      desc: '',
      args: [],
    );
  }

  /// `time`
  String get time {
    return Intl.message(
      'time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `tasksList`
  String get tasksList {
    return Intl.message(
      'tasksList',
      name: 'tasksList',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get settings {
    return Intl.message(
      'settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `notifications`
  String get notifications {
    return Intl.message(
      'notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `userAgreement`
  String get userAgreement {
    return Intl.message(
      'userAgreement',
      name: 'userAgreement',
      desc: '',
      args: [],
    );
  }

  /// `userAgreementText`
  String get userAgreementText {
    return Intl.message(
      'userAgreementText',
      name: 'userAgreementText',
      desc: '',
      args: [],
    );
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `exitAccount`
  String get exitAccount {
    return Intl.message(
      'exitAccount',
      name: 'exitAccount',
      desc: '',
      args: [],
    );
  }

  /// `kaz`
  String get kaz {
    return Intl.message(
      'kaz',
      name: 'kaz',
      desc: '',
      args: [],
    );
  }

  /// `rus`
  String get rus {
    return Intl.message(
      'rus',
      name: 'rus',
      desc: '',
      args: [],
    );
  }

  /// `eng`
  String get eng {
    return Intl.message(
      'eng',
      name: 'eng',
      desc: '',
      args: [],
    );
  }

  /// `kazakh`
  String get kazakh {
    return Intl.message(
      'kazakh',
      name: 'kazakh',
      desc: '',
      args: [],
    );
  }

  /// `russian`
  String get russian {
    return Intl.message(
      'russian',
      name: 'russian',
      desc: '',
      args: [],
    );
  }

  /// `english`
  String get english {
    return Intl.message(
      'english',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `understand`
  String get understand {
    return Intl.message(
      'understand',
      name: 'understand',
      desc: '',
      args: [],
    );
  }

  /// `{dateTime}`
  String getMonth(DateTime dateTime) {
    final DateFormat dateTimeDateFormat =
        DateFormat.MMMM(Intl.getCurrentLocale());
    final String dateTimeString = dateTimeDateFormat.format(dateTime);

    return Intl.message(
      '$dateTimeString',
      name: 'getMonth',
      desc: '',
      args: [dateTimeString],
    );
  }

  /// `{dateTime}`
  String getddMMyyyy(DateTime dateTime) {
    final DateFormat dateTimeDateFormat =
        DateFormat('dd.MM.yyyy', Intl.getCurrentLocale());
    final String dateTimeString = dateTimeDateFormat.format(dateTime);

    return Intl.message(
      '$dateTimeString',
      name: 'getddMMyyyy',
      desc: '',
      args: [dateTimeString],
    );
  }

  /// `{dateTime}`
  String getTime(DateTime dateTime) {
    final DateFormat dateTimeDateFormat =
        DateFormat('HH:mm', Intl.getCurrentLocale());
    final String dateTimeString = dateTimeDateFormat.format(dateTime);

    return Intl.message(
      '$dateTimeString',
      name: 'getTime',
      desc: '',
      args: [dateTimeString],
    );
  }

  /// `{dateTime}`
  String getDOW(DateTime dateTime) {
    final DateFormat dateTimeDateFormat = DateFormat.E(Intl.getCurrentLocale());
    final String dateTimeString = dateTimeDateFormat.format(dateTime);

    return Intl.message(
      '$dateTimeString',
      name: 'getDOW',
      desc: '',
      args: [dateTimeString],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'kk'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
