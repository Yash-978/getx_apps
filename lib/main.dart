import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CounterApp/CounterVIew/counterView.dart';
import 'UserData/UserView/Screens/UserDataView.dart';

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
      initialRoute: '/user',
      getPages: [
        GetPage(
          name: '/',
          page: () => const CounterApp(),
        ),
        GetPage(
          name: '/user',
          page: () => const UserdataPage(),
        ),
      ],
    );
  }
}
