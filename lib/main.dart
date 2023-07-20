import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numbers_sum/controller/result_controller.dart';
import 'package:numbers_sum/pages/home.dart';
import 'package:numbers_sum/pages/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ResultController _ = Get.put(ResultController());

    return GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/results': (context) => const ResultsPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Numbers sum',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const Home(),
    );
  }
}
