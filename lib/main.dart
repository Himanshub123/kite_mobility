import 'package:flutter/material.dart';
import 'package:kite_mobility/util/color_palette.dart';
import 'package:kite_mobility/view/landing_option_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          onPrimary: ColorPalette.primaryColor,
        ),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.black),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black), // Change bottom line color
          ),
        ),
        useMaterial3: true,
      ),
      home: LandingOptionScreen(),
    );
  }
}
