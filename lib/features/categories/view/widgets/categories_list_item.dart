part of '../categories_screen.dart';

class _CategoriesListItem extends StatelessWidget {
  const _CategoriesListItem({required this.categoriesData});

  final ResponseCategories categoriesData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              CustomCachedImageNetwork(
                height: 120,
                width: 100,
                fit: BoxFit.contain,
                image: categoriesData.image ?? '',
              ),
              SizedBox(width: 10),
              Text(
                categoriesData.name ?? '',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, size: 22),
              SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}
