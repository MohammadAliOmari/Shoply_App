part of '../categories_screen.dart';

class _CategoriesListView extends StatelessWidget {
  const _CategoriesListView({required this.cubit});

  final CategoriesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemCount: cubit.ressponseCategories.length,
        itemBuilder: (context, index) {
          final categoriesData = cubit.ressponseCategories[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppPages.productScreen,
                arguments: {
                  'titleText': categoriesData.name,
                  'categoryId': categoriesData.id,
                  'context': context,
                },
              );
            },
            child: _CategoriesListItem(categoriesData: categoriesData),
          );
        },
      ),
    );
  }
}
