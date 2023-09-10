import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:job_login_getx/core/values/values.dart';

import '../../controllers/example/fav_controller.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  FavController favController = Get.put(FavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Screen 5',
          style: AppTextStyles.header,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: Get.height*0.5,
            child: ListView.builder(
                itemCount: favController.fruits.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        if (favController.addFruits
                            .contains(favController.fruits[index].toString())) {
                          favController.removeItems(
                              favController.fruits[index].toString());
                        } else {
                          favController
                              .addedItems(favController.fruits[index].toString());
                        }
                      },
                      title: Text(
                        favController.fruits[index].toString(),
                        style: AppTextStyles.normalText,
                      ),
                      trailing: Obx(
                        () => Icon(
                          favController.addFruits
                                  .contains(favController.fruits[index])
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: favController.addFruits
                                  .contains(favController.fruits[index])
                              ? Colors.black
                              : Colors.red,
                        ),
                      ));
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/page6');
                },
                child: Text(
                  'Screen 6',
                  style: AppTextStyles.highlightText,
                )),
          )
        ],
      ),
    );
  }
}
