import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../auth/auth_controller.dart';
import '../../auth/user_role.dart';

abstract class BaseRoleGuard extends GetMiddleware {
  final List<UserRole> allowedRoles;

  BaseRoleGuard(this.allowedRoles);

  @override
  RouteSettings? redirect(String? route) {
    final auth = Get.find<AuthController>();

    if (!auth.isLoggedIn) {
      return const RouteSettings(name: '/landing');
    }

    if (!auth.hasAnyRole(allowedRoles)) {
      return const RouteSettings(name: '/403');
    }

    return null;
  }
}
