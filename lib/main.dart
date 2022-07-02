import 'package:flutter/material.dart';
import 'package:flutter_movies_app/constants/app_constants.dart';
import 'package:flutter_movies_app/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: AppConstants.primaryColor,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MainPage(),
    );
  }
}
