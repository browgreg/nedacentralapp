import 'package:get/get.dart';

import '../../auth/auth_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
