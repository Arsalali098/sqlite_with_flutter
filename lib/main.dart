import 'package:flutter/material.dart';
import 'package:sqlite_with_flutter/utils/theme/theme.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    themeMode: ThemeMode.system,
    theme: TAppTheme.lightTheme,
    darkTheme: TAppTheme.darkTheme,
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}