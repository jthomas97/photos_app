import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:photos_app/screens/screens.dart';

void main() {
  EquatableConfig.stringify = kDebugMode;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Photos App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: PhotosScreen(),
    );
  }
}
