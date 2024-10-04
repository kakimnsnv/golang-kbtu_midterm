import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  static ProfileScreenController get find => Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  RxString locale = 'ru'.obs;
}
