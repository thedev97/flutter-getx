import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/example/switch_controller.dart';
import '../../core/values/values.dart';

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  final SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Screen4', style: AppTextStyles.header),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  Get.toNamed('/page5');
                },
                child: Text('Example Screen4', style: AppTextStyles.header),
              ),
            ),
            Text(Get.arguments[3], style: AppTextStyles.subHeader),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Switch(
                value: switchController.isOn.value,
                onChanged: (val) {
                  switchController.switchTurn(val);
                })),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(switchController.isOn.value ? 'ON' : 'OFF',
                  style: AppTextStyles.subHeader),
            )
          ],
        )));
  }
}
