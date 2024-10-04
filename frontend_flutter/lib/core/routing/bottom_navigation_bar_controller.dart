import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  static BottomNavigationBarController get find => Get.find();

  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
