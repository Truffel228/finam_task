import 'package:finam_task/locator.dart';
import 'package:finam_task/routes.dart';
import 'package:flutter/material.dart';

void main() {
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finam Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.routes(),
      initialRoute: Routes.main,
    );
  }
}
