import '../../auth/user_role.dart';
import 'base_role_guard.dart';

class CaptainGuard extends BaseRoleGuard {
  CaptainGuard()
      : super([
          UserRole.CAPTAIN,
          UserRole.ADMIN,
          UserRole.SUPER_ADMIN,
        ]);
}
