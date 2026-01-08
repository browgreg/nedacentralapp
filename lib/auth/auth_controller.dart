import 'package:get/get.dart';

import 'user_role.dart';
import 'user_session.dart';

class AuthController extends GetxController {
  final _session = Rxn<UserSession>();

  UserSession? get session => _session.value;

  UserRole? get role => _session.value?.role;

  int? get rego => _session.value?.rego;

  bool get isLoggedIn => _session.value != null;

  void login(UserSession session) {
    _session.value = session;
  }

  void logout() {
    _session.value = null;
    Get.offAllNamed('/landing');
  }

  bool hasRole(List<UserRole> roles) {
    return role != null && roles.contains(role);
  }
}
