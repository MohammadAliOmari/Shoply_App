import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/widgets/custom_shimmer_loading.dart';

class FavoriteShimmerGrid extends StatelessWidget {
  const FavoriteShimmerGrid({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
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

  Widget _box({
    double? width,
    required double height,
    double radius = 8,
    required ThemeData theme,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: double.infinity, color: Colors.grey, height: 150),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _box(width: 110, height: 16, theme: theme), // name
                const SizedBox(height: 6),
                _box(width: 70, height: 19, theme: theme), // price
              ],
            ),
          ),
          // const SizedBox(height: 18),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: _box(
          //     theme: theme,
          //     width: double.infinity,
          //     height: 52,
          //     radius: 12,
          //   ), // button
          // ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
