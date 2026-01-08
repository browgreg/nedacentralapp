import 'package:get/get.dart';

import '../controller/committee_controller.dart';

class CommitteeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CommitteeController());
  }
}
