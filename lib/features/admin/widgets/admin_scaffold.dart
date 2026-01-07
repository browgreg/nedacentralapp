import 'package:flutter/material.dart';

class AdminScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const AdminScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: child,
    );
  }
}
