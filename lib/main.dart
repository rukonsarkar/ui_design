import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foody/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(251, 251, 251, 1),
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const Foody());
}

