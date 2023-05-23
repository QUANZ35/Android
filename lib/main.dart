import 'package:flutter/material.dart';

import 'json_parse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      debugShowCheckedModeBanner: false, //debug mode 우측상단 아이콘 제거

      home: JsonParse(),
    );
  }
}