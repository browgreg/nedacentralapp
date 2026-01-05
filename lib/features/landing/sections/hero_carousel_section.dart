import 'package:flutter/material.dart';

import '../model/poster.dart';

class HeroCarouselSection extends StatelessWidget {
  final List<Poster> posters;

  const HeroCarouselSection({super.key, required this.posters});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Center(child: Text('Hero Carousel')),
    );
  }
}