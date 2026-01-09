import 'package:get/get.dart';

import '../services/api/auth_api.dart';
import '../services/storage/session_storage.dart';
import 'user_role.dart';
import 'user_session.dart';

class AuthController extends GetxController {
  final _session = Rxn<UserSession>();

  UserSession? get session => _session.value;

  UserRole? get role => _session.value?.role;

  bool get isLoggedIn => _session.value != null;

  @override
  void onInit() {
    super.onInit();
    _restoreSession();
  }

  Future<void> login(int rego) async {
    final json = await AuthApi.login(rego);
    final session = UserSession.fromJson(json);

    _session.value = session;

    await SessionStorage.save({
      'token': session.token,
      'role': session.role!.name,
      'rego': session.rego.toString(),
      'expiresAt': session.expiresAt.toIso8601String(),
    });
  }

  Future<void> logout() async {
    _session.value = null;
    await SessionStorage.clear();
  }

  Future<void> _restoreSession() async {
    final token = await SessionStorage.read('token');
    final role = await SessionStorage.read('role');
    final rego = await SessionStorage.read('rego');
    final expires = await SessionStorage.read('expiresAt');

    if (token == null || role == null || rego == null || expires == null)
      return;

    final expiry = DateTime.tryParse(expires);
    if (expiry == null || expiry.isBefore(DateTime.now())) {
      await SessionStorage.clear();
      return;
    }

    _session.value = UserSession(
      rego: int.parse(rego),
      role: UserRole.fromString(role),
      token: token,
      expiresAt: expiry,
    );
  }
}
