import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/api/posters_api.dart';
import '../model/poster.dart';

class LandingController extends GetxController {
  final posters = <Poster>[].obs;
  final isLoading = true.obs;
  final error = RxnString();

  /// Initial + manual fetch
  Future<void> fetch(BuildContext context) async {
    try {
      isLoading.value = true;
      error.value = null;

      final result = await PostersApi.fetch();
      posters.assignAll(result);

      // Pre-cache images AFTER data loads
      await _precacheImages(context);
    } catch (e) {
      error.value = 'Failed to load content';
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ SAFE refresh (does NOT conflict with GetX internals)
  Future<void> reload(BuildContext context) => fetch(context);

  // ─────────────────────────
  // Derived views
  // ─────────────────────────

  List<Poster> get heroPosters =>
      posters
          .where((p) => p.source == PosterSource.tournament && !p.isExpired)
          .toList()
        ..sort(_sort);

  List<Poster> get clubStories =>
      posters
          .where((p) => p.source == PosterSource.club && !p.isExpired)
          .toList()
        ..sort(_sort);

  int _sort(Poster a, Poster b) {
    final p = b.priority.compareTo(a.priority);
    if (p != 0) return p;
    return b.startDate.compareTo(a.startDate);
  }

  Future<void> _precacheImages(BuildContext context) async {
    for (final p in posters) {
      await precacheImage(
        NetworkImage(
          'https://neda.club/BackEnd/posters/${p.imageName}',
        ),
        context,
      );
    }
  }
}