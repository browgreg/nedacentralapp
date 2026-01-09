import 'package:get/get.dart';
import 'package:neda_central/auth/user_role.dart';

import '../services/storage/session_storage.dart';
import 'user_session.dart';

class AuthController extends GetxController {
  final _session = Rxn<UserSession>();

  UserSession? get session => _session.value;

  bool get isLoggedIn => _session.value != null;

  UserRole get role => _session.value?.role ?? UserRole.PLAYER;

  @override
  void onInit() {
    super.onInit();
    _restoreSession();
  }

  Future<void> _restoreSession() async {
    final saved = await SessionStorage.read();
    if (saved != null) {
      _session.value = saved;
    }
  }

  Future<void> logout() async {
    await SessionStorage.clear();
    _session.value = null;
    Get.offAllNamed('/landing');
  }
}
