import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_login_getx/controllers/example/counter_controller.dart';
import '../../core/values/values.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Screen2', style: AppTextStyles.header),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Get.toNamed('/page3', arguments: [
                  'Beginner in Getx',
                  'Intermediate in Getx',
                  'Expert in Getx'
                ]);
              },
              child: Text('Example Screen2', style: AppTextStyles.header),
            ),
          ),
          Text(Get.arguments[1], style: AppTextStyles.subHeader),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Text(counterController.counter.toString(),
                style: AppTextStyles.subHeader),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.incrementCounter();
        },
        child: const Icon(
          Icons.add,
          size: 25,
        ),
      ),
    );
  }
}
