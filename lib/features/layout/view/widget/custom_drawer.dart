part of '../layout_screen.dart';

class _LayoutDrawer extends StatelessWidget {
  const _LayoutDrawer();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LayoutCubit>();
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(height: 15),
              Row(
                spacing: 15,
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: ClipOval(
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: CustomCachedImageNetwork(
                          errorWidget: Image.asset(
                            AppImages.shoplySplashImage,
                            fit: BoxFit.cover,
                          ),
                          image: LocalStorageUser.instance.profileImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      Text(
                        LocalStorageUser.instance.fullName,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          LocalStorageUser.instance.email,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(thickness: 0.1, color: Colors.grey),
              SizedBox(height: 20),
              CustomListTile(
                onTap: () => Navigator.pushNamed(context, AppPages.orderScreen),
                iconData: Icons.assignment_outlined,
                title: 'My Orders',
              ),
              SizedBox(height: 20),
              CustomListTile(
                iconData: Icons.settings_outlined,
                title: 'Settings',
              ),
              SizedBox(height: 20),
              CustomListTile(iconData: Icons.info_outline, title: 'About'),
              Spacer(),
              CustomListTile(
                onTap: () => CustomDialog.showCustomDialog(
                  context: context,
                  description: 'Are you sure you want to log out?',
                  title: 'Logout',

                  type: DialogType.question,
                  buttons: [
                    DialogButton(
                      text: 'Cancel',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    DialogButton(
                      text: 'Logout',
                      isPrimary: true,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppPages.loginScreen,
                          (route) => false,
                        );
                        cubit.logout();
                      },
                    ),
                  ],
                ),
                iconData: Icons.logout,
                title: 'Logout',
                color: Colors.red,
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
