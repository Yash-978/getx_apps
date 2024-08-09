import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/CounterApp/CounterController/counterController.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.put(CounterController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            "${counterController.count.value}",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
