import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../auth/auth_controller.dart';
import '../../auth/user_role.dart';

class BaseRoleGuard extends GetMiddleware {
  final List<UserRole> allowedRoles;

  BaseRoleGuard(this.allowedRoles);

  @override
  RouteSettings? redirect(String? route) {
    final auth = Get.find<AuthController>();

    if (!auth.isLoggedIn) {
      return const RouteSettings(name: '/landing');
    }

    if (!allowedRoles.contains(auth.role)) {
      return const RouteSettings(name: '/admin');
    }

    return null;
  }
}
