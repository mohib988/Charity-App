import "package:flutter/material.dart";

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(255, 179, 0, 1)),
      inputDecorationTheme: InputDecorationTheme(
          outlineBorder: BorderSide(color: Color.fromRGBO(255, 179, 0, 1))),
      buttonBarTheme:
          ButtonBarThemeData(buttonTextTheme: ButtonTextTheme.primary),
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 254, 155, 85),
          onPrimary: Colors.white,
          secondary: Colors.grey,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.red,
          background: Color.fromRGBO(255, 201, 75, 1),
          onBackground: Color.fromRGBO(255, 179, 0, 1),
          surface: Colors.red,
          onSurface: Colors.red));
}
