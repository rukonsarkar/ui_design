import 'package:flutter/material.dart';
import 'package:foody/screens/HomeScreen.dart';

class Foody extends StatelessWidget {
  const Foody({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      title: 'Foody',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.deepOrange,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle()),
        scaffoldBackgroundColor: const Color.fromRGBO(251, 251, 251, 1),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
