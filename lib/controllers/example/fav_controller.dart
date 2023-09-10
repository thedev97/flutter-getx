import 'package:get/get.dart';

class FavController extends GetxController{
  RxList<String> fruits = ['Mango', 'Orange', 'Apple'].obs;
  RxList addFruits = [].obs;

  addedItems(String val){
    addFruits.add(val);
  }

  removeItems(String val){
    addFruits.remove(val);
  }
}