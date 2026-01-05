import 'package:get/get.dart';
import '../../features/landing/controller/landing_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // App-wide controllers
    Get.put(LandingController(), permanent: true);
  }
}