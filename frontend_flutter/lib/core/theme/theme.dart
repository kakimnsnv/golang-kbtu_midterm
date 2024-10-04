import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TDGTheme {
  static var lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      tertiary: tertiary,
      onTertiary: onTertiary,
      error: error,
      onError: onError,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      primaryContainer: filledButtonBackgroundColor,
    ),
    dialogBackgroundColor: background,
    scaffoldBackgroundColor: background,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 19.5.sp, fontWeight: FontWeight.w700, color: Colors.white),
      titleMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.white),
      titleSmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.black),
      labelMedium: TextStyle(fontSize: 17.5.sp, fontWeight: FontWeight.w400, color: Colors.white),
      labelSmall: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: Colors.white),
      headlineLarge: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white),
      headlineMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white),
      bodySmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    appBarTheme: appBarTheme,
    bottomAppBarTheme: bottomAppBarTheme,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      elevation: 0,
    ),
    inputDecorationTheme: inputDecorationTheme,
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonThemeData,
    textButtonTheme: textButtonThemeData,
    filledButtonTheme: filledButtonThemeData,
    useMaterial3: true,
  );

  static var darkTheme = ThemeData(
    primarySwatch: Colors.purple,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF5E4EDE),
      onPrimary: Colors.white,
      secondary: Color(0xFFEEEEFB),
      onSecondary: Colors.black,
      error: Color(0xFFFFDFE5),
      onError: Colors.black,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Color(0xFFEDEDED),
      onSurface: Color(0xFF474545),
    ),
    useMaterial3: true,
  );
}

const Color primary = Color(0xFF5E4EDE);
const Color primary2 = Color(0xFF3028CB);
const Color primary3 = Color(0xFF5953D5);
const Color onPrimary = Colors.white;
const Color secondary = Color(0xFF5E4EDE);
const Color onSecondary = Colors.white;
const Color tertiary = Color(0xFFFFF0DF);
const Color onTertiary = Colors.black;
const Color error = Color(0xFFFFDFE5);
const Color onError = Colors.black;
const Color background = Colors.white;
const Color onBackground = Colors.black;
const Color surface = Color(0xFFEDEDED);
const Color onSurfacText = Color(0xFF959595);
const Color onSurface = Color(0xFF474545);

const Color achievementBlockedColor = Color(0xffF6F6F6);

const Color lowPriorityColor = Color(0xffEEEEFB);
const Color lowPriorityBorderColor = primary;
const Color midPriorityColor = tertiary;
const Color midPriorityBorderColor = Color(0xffFEBB6D);
const Color highPriorityColor = error;
const Color highPriorityBorderColor = Color(0xffFF2B54);

const Color primaryButtonBackgroundColor = primary;
const Color primaryButtonDisabledBackgroundColor = secondary;
const Color primaryButtonForegroundColor = Colors.white;
const Color primaryButtonDisabledForegroundColor = Colors.grey;

Color filledButtonBackgroundColor = primary3.withOpacity(0.3);
const Color filledButtonDisabledBackgroundColor = secondary;
const Color filledButtonForegroundColor = primary;
const Color filledButtonDisabledForegroundColor = Colors.grey;

const Color secondaryButtonBackgroundColor = Colors.white;
const Color secondaryButtonDisabledBackgroundColor = Colors.grey;
const Color secondaryButtonForegroundColor = primary;
const Color secondaryButtonDisabledForegroundColor = secondary;

const Color textButtonColor = Colors.white;
const Color textButtonDisabledColor = Colors.grey;

TextButtonThemeData textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) {
            return textButtonDisabledColor;
          }
          return textButtonColor;
        },
      ),
      elevation: WidgetStateProperty.all(0),
      splashFactory: NoSplash.splashFactory,
      backgroundColor: WidgetStateProperty.all(Colors.transparent)
      // side: WidgetStateProperty.resolveWith(
      //   (states) {
      //     if (states.contains(WidgetState.disabled)) {
      //       return const BorderSide(color: textButtonDisabledColor);
      //     }
      //     return const BorderSide(color: textButtonColor);
      //   },
      // ),
      ),
);

OutlinedButtonThemeData outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15).r),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16).r, side: BorderSide.none)),
    elevation: const WidgetStatePropertyAll(0),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return secondaryButtonDisabledBackgroundColor;
      }
      return secondaryButtonBackgroundColor;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return secondaryButtonDisabledForegroundColor;
      }
      return secondaryButtonForegroundColor;
    }),
  ),
);

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15).r),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16).r)),
    elevation: const WidgetStatePropertyAll(0),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return primaryButtonDisabledBackgroundColor;
      }
      return primaryButtonBackgroundColor;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return primaryButtonDisabledForegroundColor;
      }
      return primaryButtonForegroundColor;
    }),
  ),
);

FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
  style: ButtonStyle(
    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15).r),
    shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16).r)),
    elevation: const WidgetStatePropertyAll(0),
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return filledButtonDisabledBackgroundColor;
      }
      return filledButtonBackgroundColor;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return filledButtonDisabledForegroundColor;
      }
      return filledButtonForegroundColor;
    }),
  ),
);

BoxDecoration onBoardingAndAuthBackgroundDecoration = const BoxDecoration(
  gradient: LinearGradient(
    colors: [
      primary2,
      primary3,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Colors.transparent,
  elevation: 0,
  centerTitle: true,
  iconTheme: const IconThemeData(color: primary),
  titleTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.black),
);

BottomAppBarTheme bottomAppBarTheme = const BottomAppBarTheme(
  elevation: 0,
  color: Colors.white,
);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: surface,
  focusColor: primary2.withOpacity(0.05),
  errorStyle: TextStyle(color: Colors.red),
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14).r,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16).r,
    borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16).r,
    borderSide: const BorderSide(color: primary2, width: 1),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16).r,
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16).r,
    borderSide: const BorderSide(color: Colors.redAccent, width: 1),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(16).r,
    borderSide: const BorderSide(color: Colors.red, width: 1),
  ),
);
