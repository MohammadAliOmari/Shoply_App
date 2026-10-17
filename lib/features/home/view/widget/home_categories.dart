part of '../home_screen.dart';

class _HomeCategories extends StatelessWidget {
  const _HomeCategories();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
            scrollDirection: Axis.horizontal,
            itemCount: cubit.ressponseCategories.length,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              final categoryData = cubit.ressponseCategories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppPages.productScreen,
                    arguments: {
                      'titleText': categoryData.name,
                      'categoryId': categoryData.id,
                    },
                  );
                },
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade100,
                      ),
                      child: CustomCachedImageNetwork(
                        height: 90,
                        fit: BoxFit.contain,
                        width: 100,
                        image: categoryData.image ?? '',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      categoryData.name ?? '',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
