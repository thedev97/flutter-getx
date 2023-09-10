import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/values.dart';

class Screen1 extends StatefulWidget {
  var name;

  Screen1({super.key, this.name});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Screen1', style: AppTextStyles.header),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  Get.toNamed('/page2', arguments: [
                    'Beginner in Getx',
                    'Intermediate in Getx',
                    'Expert in Getx'
                  ]);
                },
                child: Text('Example Screen1', style: AppTextStyles.header),
              ),
            ),
            Text(Get.arguments[0], style: AppTextStyles.subHeader),
            const SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text(
                'msg'.tr,
                style: AppTextStyles.header,
              ),
              subtitle: Text(
                'submsg'.tr,
                style: AppTextStyles.subHeader,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(const Locale('en', 'US'));
                  },
                  child: Text(
                    'English',
                    style: AppTextStyles.header,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(const Locale('hindi', 'IN'));
                  },
                  child: Text(
                    'Hindi',
                    style: AppTextStyles.header,
                  ),
                )
              ],
            )
          ],
        )));
  }
}
