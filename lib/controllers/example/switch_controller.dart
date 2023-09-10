import 'package:get/get.dart';

class SwitchController extends GetxController{
  RxBool isOn = false.obs;

  switchTurn(val){
    isOn.value = val;
  }
}