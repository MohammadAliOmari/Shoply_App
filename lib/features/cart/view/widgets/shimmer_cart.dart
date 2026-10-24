import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CartShimmerList extends StatelessWidget {
  const CartShimmerList({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.separated(
        itemCount: itemCount,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemBuilder: (context, index) => const _CartShimmerItem(),
      ),
    );
  }
}

class _CartShimmerItem extends StatelessWidget {
  const _CartShimmerItem();

  Widget _box({double? width, required double height, double radius = 8}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white, // Shimmer paints its gradient over this
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: _box(width: 110, height: 110, radius: 16),
        ),
        // Name, price, quantity box
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _box(width: 130, height: 17),
              const SizedBox(height: 5),
              _box(width: 80, height: 20),
              const SizedBox(height: 15),
              _box(width: 155, height: 45, radius: 16),
            ],
          ),
        ),
        // Delete icon
        _box(width: 26, height: 26, radius: 6),
        const SizedBox(width: 15),
      ],
    );
  }
}
