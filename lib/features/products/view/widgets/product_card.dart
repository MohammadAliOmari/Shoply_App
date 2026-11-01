part of '../products_screen.dart';

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.productsData});

  final ResponseProducts productsData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: theme.cardColor,
          ),
          child: CustomCachedImageNetwork(
            fit: BoxFit.contain,
            image: productsData.images[0],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            productsData.name ?? '',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '\$ ${productsData.price}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
