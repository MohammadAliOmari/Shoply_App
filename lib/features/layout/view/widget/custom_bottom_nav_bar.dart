part of '../layout_screen.dart';

class _CustomBottmNavBar extends StatelessWidget {
  const _CustomBottmNavBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final cubit = context.read<LayoutCubit>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(height: 1, thickness: 0.4, color: Colors.grey),
            NavigationBar(
              selectedIndex: cubit.selectedIndex,
              onDestinationSelected: (index) {
                cubit.changeNavBarIndex(index);
              },
              indicatorShape: CircleBorder(),
              destinations: [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),

                NavigationDestination(
                  icon: Icon(Icons.grid_view_outlined),
                  selectedIcon: Icon(Icons.grid_view_rounded),
                  label: 'Categories',
                ),
                NavigationDestination(
                  icon: cubit.favCount != 0
                      ? Badge(
                          padding: EdgeInsets.all(1),
                          offset: Offset(6, -10),
                          backgroundColor: AppColors.primaryColor,
                          label: Center(
                            child: Text(
                              '${cubit.favCount}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Icon(Icons.favorite_outline),
                        )
                      : Icon(Icons.favorite_outline),
                  selectedIcon: cubit.favCount != 0
                      ? Badge(
                          padding: EdgeInsets.all(1),
                          offset: Offset(6, -10),
                          backgroundColor: AppColors.primaryColor,
                          label: Center(
                            child: Text(
                              '${cubit.favCount}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Icon(Icons.favorite),
                        )
                      : Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                NavigationDestination(
                  icon: cubit.cartCount != 0
                      ? Badge(
                          padding: EdgeInsets.all(1),
                          offset: Offset(6, -10),
                          backgroundColor: AppColors.primaryColor,
                          label: Center(
                            child: Text(
                              '${cubit.cartCount}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Icon(Icons.shopping_cart_outlined),
                        )
                      : Icon(Icons.shopping_cart_outlined),
                  selectedIcon: cubit.cartCount != 0
                      ? Badge(
                          padding: EdgeInsets.all(1),
                          offset: Offset(6, -10),
                          backgroundColor: AppColors.primaryColor,
                          label: Center(
                            child: Text(
                              '${cubit.cartCount}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Icon(Icons.shopping_cart),
                        )
                      : Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
