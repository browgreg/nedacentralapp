import 'package:get/get.dart';

import '../routes/app_routes.dart';
import '../services/api/auth_api.dart';
import '../services/storage/session_storage.dart';
import 'user_role.dart';
import 'user_session.dart';

class AuthController extends GetxController {
  final _session = Rxn<UserSession>();

  UserSession? get session => _session.value;

  bool get isLoggedIn => _session.value != null;

  UserRole? get role => _session.value?.role;

  bool get mustChangePin => _session.value?.mustChangePin ?? false;

  @override
  void onInit() {
    super.onInit();
    _restoreSession();
  }

  Future<void> login(int rego, String pin) async {
    final res = await AuthApi.login(rego: rego, pin: pin);

    final session = UserSession.fromJson(res);

    _session.value = session;
    await SessionStorage.write(session);

    if (session.mustChangePin) {
      Get.offAllNamed('/change-pin');
    } else {
      Get.offAllNamed(AppRoutes.admin);
    }
  }

  Future<void> _restoreSession() async {
    final restored = await SessionStorage.read();
    _session.value = restored;

    if (restored == null) return;

    if (restored.mustChangePin) {
      Get.offAllNamed('/change-pin');
    } else {
      Get.offAllNamed(AppRoutes.admin);
    }
  }

  Future<void> changePin(String pin) async {
    await AuthApi.changePin(pin);

    final updated = session!.copyWith(mustChangePin: false);
    _session.value = updated;
    await SessionStorage.write(updated);

    Get.offAllNamed(AppRoutes.admin);
  }

  Future<void> logout() async {
    _session.value = null;
    await SessionStorage.clear();
    Get.offAllNamed('/landing');
  }
}
