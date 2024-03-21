/**
 * Created by Jaimin on 21/03/24.
 */


import 'package:flutter/material.dart';

import 'Colors.dart';

//-------------light theme------------------//
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  brightness: Brightness.light,
  appBarTheme:
      const AppBarTheme(backgroundColor: backgroundColor, centerTitle: true),
  useMaterial3: true,
);

//------------------dark theme----------------//
ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black38,
  brightness: Brightness.dark,
  appBarTheme:
      const AppBarTheme(backgroundColor: Colors.black38, centerTitle: true),
  useMaterial3: true,
);
