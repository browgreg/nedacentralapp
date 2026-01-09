import 'package:get/get.dart';

import '../../../auth/auth_controller.dart';
import '../model/captain_permission.dart';

class CaptainController extends GetxController {
  final auth = Get.find<AuthController>();

  bool hasPermission(CaptainPermission permission) {
    final role = auth.role;
    if (role == null) return false;

    return captainPermissions[role.name]?.contains(permission) ?? false;
  }
}
