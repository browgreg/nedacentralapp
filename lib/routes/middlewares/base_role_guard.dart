import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../auth/auth_controller.dart';
import '../../auth/user_role.dart';

class BaseRoleGuard extends GetMiddleware {
  final List<UserRole> allowed;

  BaseRoleGuard(this.allowed);

  @override
  RouteSettings? redirect(String? route) {
    final auth = Get.find<AuthController>();
    if (auth.mustChangePin && route != '/change-pin') {
      return const RouteSettings(name: '/change-pin');
    }
    if (!auth.isLoggedIn) {
      return const RouteSettings(name: '/landing');
    }

    if (!allowed.contains(auth.role)) {
      return const RouteSettings(name: '/admin');
    }

    return null;
  }
}
