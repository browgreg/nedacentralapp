import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/admin/committee/controller/committee_controller.dart';
import '../../features/admin/committee/dashboard/committee_permission.dart';

class CommitteePermissionGuard extends GetMiddleware {
  final CommitteePermission permission;

  CommitteePermissionGuard(this.permission);

  @override
  RouteSettings? redirect(String? route) {
    final controller = Get.find<CommitteeController>();

    if (!controller.hasPermission(permission)) {
      return const RouteSettings(name: '/admin'); // fallback
    }

    return null;
  }
}
