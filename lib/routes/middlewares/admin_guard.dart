import '../../auth/user_role.dart';
import 'base_role_guard.dart';

class AdminGuard extends BaseRoleGuard {
  AdminGuard()
      : super([
          UserRole.SUPER_ADMIN,
          UserRole.ADMIN,
        ]);
}
