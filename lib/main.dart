import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:music_player2023/consts/colors.dart';
import 'package:music_player2023/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JILLY',
        theme: ThemeData(
          fontFamily: "ExtraLightItalic",
          appBarTheme:
              const AppBarTheme(backgroundColor: bgDarkColor, elevation: 0),
        ),
        home: const Home());
  }
}
