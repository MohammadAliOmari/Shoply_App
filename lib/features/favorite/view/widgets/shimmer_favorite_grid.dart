import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteShimmerGrid extends StatelessWidget {
  const FavoriteShimmerGrid({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
        itemCount: itemCount,
        physics:
            const NeverScrollableScrollPhysics(), // no scrolling while loading
        padding: const EdgeInsets.symmetric(horizontal: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => const _FavoriteShimmerCard(),
      ),
    );
  }
}

class _FavoriteShimmerCard extends StatelessWidget {
  const _FavoriteShimmerCard();

  Widget _box({double? width, required double height, double radius = 8}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white, // Shimmer paints over this with its gradient
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image area
          Expanded(
            child: Container(width: double.infinity, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _box(width: 110, height: 16), // name
                const SizedBox(height: 6),
                _box(width: 70, height: 19), // price
              ],
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _box(
              width: double.infinity,
              height: 52,
              radius: 12,
            ), // button
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
