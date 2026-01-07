import 'package:flutter/material.dart';
import 'package:neda_central/core/theme/neda_theme.dart';

class AdminScaffold extends StatelessWidget {
  final String title;
  final Widget child;
  final List<Widget>? actions;

  const AdminScaffold({
    super.key,
    required this.title,
    required this.child,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: nedaWhite,
        title: Text(
          title,
          style: TextStyle(color: nedaWhite),
        ),
        backgroundColor: Colors.black,
        actions: actions,
      ),
      backgroundColor: Colors.black,
      body: child,
    );
  }
}
