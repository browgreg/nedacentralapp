import '../../auth/user_role.dart';
import 'base_role_guard.dart';

class CommitteeGuard extends BaseRoleGuard {
  CommitteeGuard()
      : super([
          UserRole.COMMITTEE,
          UserRole.ADMIN,
          UserRole.SUPER_ADMIN,
        ]);
}
