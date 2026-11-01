part of '../layout_screen.dart';

class _LayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _LayoutAppBar({required this.index, required this.title});
  final int index;
  final String title;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return _CustomLayoutAppBar(
      title: index == 0
          ? Wrap(
              children: [
                Text(
                  'Shop',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Text(
                  'ly',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
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
                fontStyle: FontStyle.normal,
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _CustomLayoutAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomLayoutAppBar({this.title});
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(scrolledUnderElevation: 0, title: title, centerTitle: true);
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
