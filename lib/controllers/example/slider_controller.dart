import 'package:get/get.dart';

class SliderController extends GetxController {
  RxDouble opacity = .1.obs;

  increaseOpacity(double val) {
    opacity.value = val;
  }
}
