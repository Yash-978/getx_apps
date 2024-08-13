# 🛠 getx_state_management

####  GetX is a powerful and lightweight Flutter package that provides tools for state management, dependency injection, and route management. It’s designed to make your Flutter application more maintainable and scalable by using a reactive programming approach.

### Key Features of GetX:
- Reactive Programming: The reactive approach in GetX allows you to update the UI based on data changes instantly, improving the performance and user experience.
- Minimal Boilerplate: GetX reduces the amount of code you need to write, making your application more readable and easier to maintain.
- Simple API: GetX’s API is intuitive and easy to use, which helps in building complex applications with less effort.
- High Performance: GetX is optimized for performance and memory usage, making it suitable for large-scale applications.

### Basic Example
```
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}

// Usage in a Flutter widget
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
```
## Counter app
<div align ="center">
  <img src = "https://github.com/user-attachments/assets/bc3410a3-1bdf-4ae1-b894-db0ab2c38c07"  height=35% width=22%  />
  <video height="450" src="https://github.com/user-attachments/assets/7330ff8b-d6e7-4949-a43f-291830b27b74" />

</div>
