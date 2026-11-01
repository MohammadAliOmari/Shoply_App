part of '../favorite_screen.dart';

class _FavouriteGrid extends StatelessWidget {
  const _FavouriteGrid();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoriteCubit>();
    final theme = Theme.of(context);
    return GridView.builder(
      itemCount: cubit.favoriteList.length,
      padding: EdgeInsets.symmetric(horizontal: 12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final favoriteData = cubit.favoriteList[index];
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.cardColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: theme.cardColor),
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    CustomCachedImageNetwork(
                      fit: BoxFit.contain,
                      image: favoriteData.images.first,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: Align(
                        alignment: AlignmentGeometry.topRight,
                        child: GestureDetector(
                          onTap: () {
                            cubit.removeProductFromFav(
                              productId: favoriteData.id ?? '',
                              context: context,
                            );
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 28,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favoriteData.name ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$ ${favoriteData.price}',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  radius: 12,
                  height: 52,
                  fontSize: 17,
                  buttonText: 'Add to Cart',
                  onPressed: () {
                    cubit.addToCart(
                      context: context,
                      requestCart: Cart(
                        id: favoriteData.id,
                        name: favoriteData.name,
                        price: favoriteData.price,
                        quantity: 1,
                        images: favoriteData.images,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
