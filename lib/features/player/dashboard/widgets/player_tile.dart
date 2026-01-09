import 'package:flutter/material.dart';

class PlayerTile extends StatelessWidget {
  final String name;
  final int rego;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool isCaptain;
  final bool isInactive;

  const PlayerTile({
    super.key,
    required this.name,
    required this.rego,
    this.onTap,
    this.trailing,
    this.isCaptain = false,
    this.isInactive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        enabled: !isInactive,
        onTap: onTap,
        leading: CircleAvatar(
          child: Text(
            name.isNotEmpty ? name[0].toUpperCase() : '?',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isInactive ? Colors.grey : null,
                ),
              ),
            ),
            if (isCaptain)
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.amber,
                ),
              ),
          ],
        ),
        subtitle: Text(
          'Rego: $rego',
          style: TextStyle(
            color: isInactive ? Colors.grey : null,
          ),
        ),
        trailing: trailing ?? const Icon(Icons.chevron_right),
      ),
    );
  }
}
