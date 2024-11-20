import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get instance {
    return Get.find<LoginController>();
  }

  var isLoading = false.obs;
}
