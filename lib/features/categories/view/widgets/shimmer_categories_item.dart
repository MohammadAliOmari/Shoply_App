import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/widgets/custom_shimmer_loading.dart';

class CategoryItemShimmer extends StatelessWidget {
  const CategoryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              // Image placeholder
              ShimmerLoading(
                child: Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // Category name placeholder
              ShimmerLoading(
                child: Container(
                  height: 20,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Spacer(),
              // Arrow icon
              Icon(
                Icons.arrow_forward_ios,
                size: 22,
                color: Colors.grey.shade400,
              ),

              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}
