import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/example/slider_controller.dart';
import '../../core/values/values.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  final SliderController sliderController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Screen3', style: AppTextStyles.header),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  Get.toNamed('/page4', arguments: [
                    'Beginner in Getx',
                    'Intermediate in Getx',
                    'Expert in Getx',
                    'Advanced in Getx'
                  ]);
                },
                child: Text('Example Screen3', style: AppTextStyles.header),
              ),
            ),
            Text(Get.arguments[2], style: AppTextStyles.subHeader),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.red
                            .withOpacity(sliderController.opacity.value),
                      ),
                      child: Center(
                        child: Text(
                          'Container 1',
                          style: AppTextStyles.header,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(sliderController.opacity.value),
                      ),
                      child: Center(
                        child: Text(
                          'Container 2',
                          style: AppTextStyles.header,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Slider(
                  onChanged: (val) => sliderController.increaseOpacity(val),
                  value: sliderController.opacity.value,
                  min: 0.0,
                  max: 1.0,
                  activeColor: Colors.black,
                ))
          ],
        )));
  }
}
