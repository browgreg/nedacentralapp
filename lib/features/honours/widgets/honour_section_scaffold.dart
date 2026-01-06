import 'package:flutter/material.dart';

class HonourSectionScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const HonourSectionScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(title)),
      body: child,
    );
  }
}
