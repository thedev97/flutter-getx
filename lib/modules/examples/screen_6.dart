import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/example/image_controller.dart';
import '../../core/values/values.dart';

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  ImgPickerController imgPickerController = Get.put(ImgPickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Screen 6',
            style: AppTextStyles.header,
          ),
        ),
        body: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: imgPickerController.imagePath.isNotEmpty
                        ? FileImage(
                            File(imgPickerController.imagePath.toString()))
                        : null,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    imgPickerController.getImage();
                  },
                  child: Text('Pick~Image', style: AppTextStyles.header),
                ),
              ],
            )));
  }
}
