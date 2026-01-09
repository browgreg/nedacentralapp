import '../../auth/user_role.dart';
import 'base_role_guard.dart';

class CaptainGuard extends BaseRoleGuard {
  CaptainGuard()
      : super([
          UserRole.SUPER_ADMIN,
          UserRole.ADMIN,
          UserRole.CAPTAIN,
        ]);
}
