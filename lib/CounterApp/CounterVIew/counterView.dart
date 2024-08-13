import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apps/CounterApp/CounterController/counterController.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.put(CounterController());
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterController.decrement();
            },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              counterController.increment();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Counter App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Obx(
          () => Text(
            "${counterController.count.value}",
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
