import 'package:get/get.dart';

import '../controller/honours_controller.dart';

class HonoursBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HonoursController>(() => HonoursController());
  }
}
