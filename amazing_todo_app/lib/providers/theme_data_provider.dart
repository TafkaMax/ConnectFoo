import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDataProvider with ChangeNotifier {
  static const mainColor = const Color(0xffB8A081);
  bool _useDarkTheme;
  SharedPreferences _prefs;
  ThemeDataProvider() {
    _useDarkTheme = false;
    _loadPrefs();
  }

  ThemeData get themeData => _useDarkTheme ? appThemeDark : appThemeLight;

  bool get isDarkTheme => _useDarkTheme;

  void toggleTheme() {
    _useDarkTheme = !_useDarkTheme;
    _savePrefs();
    notifyListeners();
  }

  _loadPrefs() async {
    await _initPrefs();
    if (_prefs != null) {
      _useDarkTheme = _prefs.getBool("useDarkMode") ?? true;
      notifyListeners();
    }
  }

  _savePrefs() async {
    await _initPrefs();
    if (_prefs != null) {
      await _prefs.setBool("useDarkMode", _useDarkTheme);
    }
  }

  _initPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  ThemeData appThemeDark = ThemeData(
    fontFamily: 'Assistant',
    brightness: Brightness.dark,
    primaryColor: Colors.brown,
    accentColor: mainColor,
    disabledColor: Colors.grey,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline1: TextStyle(
          color: mainColor,
          fontSize: 40,
          fontWeight: FontWeight.w300,
        ),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: mainColor,
        size: 35,
      ),
      actionsIconTheme: IconThemeData(),
    ),
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: mainColor,
      ),
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      textStyle: TextStyle(
        color: mainColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        primary: Colors.brown,
        onPrimary: mainColor,
        elevation: 2.0,
        shadowColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide(
          color: Colors.black26,
          width: 1,
          style: BorderStyle.solid,
        ),
        textStyle: TextStyle(
          fontSize: 30,
          fontFamily: 'Assistant',
          fontWeight: FontWeight.w300,
        ),
        // padding: EdgeInsets.symmetric(vertical: 9),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: mainColor,
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          decoration: TextDecoration.underline,
          decorationThickness: 1.0,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: mainColor,
        focusColor: mainColor,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: mainColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: mainColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        )),
    // textTheme: TextTheme(),
    // textButtonTheme: TextButtonThemeData(),
  );

  ThemeData appThemeLight = ThemeData(
    fontFamily: 'Assistant',
    brightness: Brightness.light,
    primaryColor: mainColor,
    accentColor: mainColor,
    disabledColor: Colors.grey,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w300,
          color: Colors.brown,
        ),
        bodyText2: TextStyle(
          color: mainColor,
        ),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.brown,
        size: 35,
      ),
      actionsIconTheme: IconThemeData(),
    ),
    popupMenuTheme: PopupMenuThemeData(
      elevation: 3.0,
      color: mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      textStyle: TextStyle(
        color: Colors.brown,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        primary: mainColor,
        onPrimary: Colors.brown,
        elevation: 4.0,
        shadowColor: Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide(
          color: Colors.black26,
          width: 1,
          style: BorderStyle.solid,
        ),
        textStyle: TextStyle(
          fontSize: 30,
          fontFamily: 'Assistant',
          fontWeight: FontWeight.w300,
        ),
        // padding: EdgeInsets.symmetric(vertical: 9),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.black,
        textStyle: TextStyle(
          fontWeight: FontWeight.w300,
          decoration: TextDecoration.underline,
          decorationThickness: 1.0,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
        fillColor: mainColor,
        focusColor: mainColor,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: mainColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 3,
            color: mainColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          ),
        )),
    // textTheme: TextTheme(),
    // textButtonTheme: TextButtonThemeData(),
  );
}
