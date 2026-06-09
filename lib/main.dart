import 'package:flutter/material.dart';
import 'package:sqlite_with_flutter/utils/theme/theme.dart';
import 'package:sqlite_with_flutter/widget/reusable_detailed_card.dart';
import 'carousle_slider.dart';

void main() {
  runApp(MaterialApp(
    // themeMode: ThemeMode.system,
    // theme: TAppTheme.lightTheme,
    // darkTheme: TAppTheme.darkTheme,
    debugShowCheckedModeBanner: false,
    home: ReusableDetailedCard(),
  ));
}