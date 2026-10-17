part of '../layout_screen.dart';

class _LayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _LayoutAppBar({required this.index, required this.title});
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: index == 0
          ? Wrap(
              children: [
                Text(
                  'Shop',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  'ly',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            )
          : Text(
              title,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontStyle: FontStyle.normal,
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
