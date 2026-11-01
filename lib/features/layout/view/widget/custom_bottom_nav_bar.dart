part of '../layout_screen.dart';

class _CustomBottmNavBar extends StatelessWidget {
  const _CustomBottmNavBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        final cubit = context.read<LayoutCubit>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(height: 1, thickness: 1, color: theme.dividerColor),
            NavigationBar(
              backgroundColor: theme.bottomNavigationBarTheme.backgroundColor,
              selectedIndex: cubit.selectedIndex,
              onDestinationSelected: (index) {
                cubit.changeNavBarIndex(index);
              },
              indicatorShape: CircleBorder(),
              indicatorColor: AppColors.primaryColor,
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
                          backgroundColor: theme.primaryColor,
                          label: Center(
                            child: Text(
                              '${cubit.favCount}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
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
                          backgroundColor: theme.primaryColor,
                          label: Center(
                            child: Text(
                              '${cubit.favCount}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
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
                          backgroundColor: theme.primaryColor,
                          label: Center(
                            child: Text(
                              '${cubit.cartCount}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
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
                          backgroundColor: theme.primaryColor,
                          label: Center(
                            child: Text(
                              '${cubit.cartCount}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          child: Icon(Icons.shopping_cart),
                        )
                      : Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_2_outlined),
                  selectedIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
