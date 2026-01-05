import 'package:flutter/material.dart';
import '../../../../core/widgets/skeleton_box.dart';

class LandingSkeleton extends StatelessWidget {
  const LandingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        // Hero carousel skeleton
        Padding(
          padding: EdgeInsets.all(16),
          child: SkeletonBox(
            width: double.infinity,
            height: 220,
          ),
        ),

        // Club stories skeleton
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SkeletonBox(
            width: double.infinity,
            height: 420,
          ),
        ),
      ],
    );
  }
}