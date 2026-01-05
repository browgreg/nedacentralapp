import 'package:flutter/material.dart';

class ShimmerBox extends StatefulWidget {
  final double? height;
  final double? width;
  final Color? color;

  const ShimmerBox({super.key, 
    this.height,
    this.width,
    this.color,
  });

  @override
  State<ShimmerBox> createState() => ShimmerBoxState();
}

class ShimmerBoxState extends State<ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (_, __) {
        return Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment(-1 + _c.value * 2, 0),
              end: const Alignment(1, 0),
              colors: [
                widget.color ?? Colors.grey.shade800,
                Colors.grey.shade700,
                widget.color ?? Colors.grey.shade800,
              ],
            ),
          ),
        );
      },
    );
  }
}