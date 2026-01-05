import 'dart:ui';
import 'package:flutter/material.dart';

class FadeInNetworkImage extends StatefulWidget {
  final String imageUrl;
  final BoxFit fit;
  final double blur;
  final Duration duration;
  final BorderRadius? borderRadius;

  const FadeInNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.blur = 16,
    this.duration = const Duration(milliseconds: 450),
    this.borderRadius,
  });

  @override
  State<FadeInNetworkImage> createState() => _FadeInNetworkImageState();
}

class _FadeInNetworkImageState extends State<FadeInNetworkImage> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    Widget image = Image.network(
      widget.imageUrl,
      fit: widget.fit,
      frameBuilder: (_, child, frame, __) {
        if (frame != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!_loaded) setState(() => _loaded = true);
          });
        }
        return child;
      },
      errorBuilder: (_, __, ___) => Container(
        color: Colors.black12,
      ),
    );

    if (widget.borderRadius != null) {
      image = ClipRRect(
        borderRadius: widget.borderRadius!,
        child: image,
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        // ─── BLURRED PLACEHOLDER ───
        if (!_loaded)
          ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: widget.blur,
              sigmaY: widget.blur,
            ),
            child: image,
          ),

        // ─── FINAL IMAGE ───
        AnimatedOpacity(
          opacity: _loaded ? 1 : 0,
          duration: widget.duration,
          curve: Curves.easeOutCubic,
          child: image,
        ),
      ],
    );
  }
}