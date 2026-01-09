import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/captain/controller/captain_controller.dart';
import '../../features/captain/model/captain_permission.dart';

class CaptainPermissionGuard extends GetMiddleware {
  final CaptainPermission permission;

  CaptainPermissionGuard(this.permission);

  @override
  RouteSettings? redirect(String? route) {
    final controller = Get.find<CaptainController>();

    if (!controller.hasPermission(permission)) {
      return const RouteSettings(name: '/landing');
    }

    return null;
  }
}
