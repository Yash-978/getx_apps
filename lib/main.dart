import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CounterApp/CounterVIew/counterView.dart';

// import '';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => const CounterApp(),
        ),
        GetPage(
          name: '/',
          page: () => const CounterApp(),
        ),
      ],
    );
  }
}
