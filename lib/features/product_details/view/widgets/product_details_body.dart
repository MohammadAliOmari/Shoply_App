part of '../product_details_screen.dart';

class _ProductDetailsBody extends StatelessWidget {
  const _ProductDetailsBody({required this.responseProducts});

  final ResponseProducts responseProducts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            responseProducts.name ?? '',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            '\$ ${responseProducts.price ?? ''}',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor,
            ),
          ),
          SizedBox(height: 20),
          Text(
            responseProducts.description ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
