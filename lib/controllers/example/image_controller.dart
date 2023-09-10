import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImgPickerController extends GetxController {
  RxString imagePath = ''.obs;

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePath.value = image.path.toString();
    }
  }
}
