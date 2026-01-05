import 'package:flutter/material.dart';

class SkeletonBox extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius radius;

  const SkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.radius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  State<SkeletonBox> createState() => _SkeletonBoxState();
}

class _SkeletonBoxState extends State<SkeletonBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _shimmer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();

    _shimmer = Tween<double>(begin: -1, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmer,
      builder: (_, __) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.radius,
            gradient: LinearGradient(
              begin: Alignment(-1, -0.3),
              end: Alignment(1, 0.3),
              colors: [
                const Color(0xFF1F2937),
                const Color(0xFF374151),
                const Color(0xFF1F2937),
              ],
              stops: [
                (_shimmer.value - 0.4).clamp(0.0, 1.0),
                _shimmer.value.clamp(0.0, 1.0),
                (_shimmer.value + 0.4).clamp(0.0, 1.0),
              ],
            ),
          ),
        );
      },
    );
  }
}