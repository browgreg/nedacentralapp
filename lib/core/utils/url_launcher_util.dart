import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openExternalUrl(
    BuildContext context,
    String? url,
    ) async {
  if (url == null || url.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Link not available')),
    );
    return;
  }

  final uri = Uri.tryParse(url);
  if (uri == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Invalid link')),
    );
    return;
  }

  if (!await canLaunchUrl(uri)) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Unable to open link')),
    );
    return;
  }

  await launchUrl(uri, mode: LaunchMode.externalApplication);
}