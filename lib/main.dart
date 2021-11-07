import 'package:flutter/material.dart';
import 'package:layout/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "แอพแนะนำเรื่องวัคซีนโควิด",
      home: HomeScreen(),
    );
  }
}


