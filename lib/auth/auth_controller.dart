import 'package:get/get.dart';

import 'user_role.dart';
import 'user_session.dart';

class AuthController extends GetxController {
  final Rxn<UserSession> _session = Rxn<UserSession>();

  UserSession? get session => _session.value;

  UserRole? get role => _session.value?.role;

  bool get isLoggedIn => _session.value != null;

  /// DEV ONLY auto-login
  @override
  void onInit() {
    super.onInit();

    // REMOVE later when real auth is wired
    _session.value = UserSession(
      rego: 999999,
      role: UserRole.SUPER_ADMIN,
    );
  }

  bool hasAnyRole(List<UserRole> roles) {
    final r = role;
    if (r == null) return false;
    return roles.contains(r);
  }

  void logout() {
    _session.value = null;
    Get.offAllNamed('/landing');
  }
}
