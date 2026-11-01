import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_dialog/pro_dialog.dart';
import 'package:shoply_app/core/local/local_storage.dart';
import 'package:shoply_app/core/local/local_storge_user.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/core/utils/widgets/custom_dialog.dart';
import 'package:shoply_app/features/layout/view_model/cubit.dart';
part 'widgets/build_profile_header.dart';
part 'widgets/build_menu_section.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const _BuildProfileHeader(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 22),
                          _buildMenuSection([
                            _MenuData(
                              icon: Icons.inventory_2_outlined,
                              title: 'My Orders',
                              subtitle: 'Track and manage your orders',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppPages.orderScreen,
                                );
                              },
                            ),
                            _MenuData(
                              icon: Icons.favorite_border,
                              title: 'My Favorites',
                              subtitle: 'Your saved items',
                              onTap: () {
                                context.read<LayoutCubit>().changeNavBarIndex(
                                  2,
                                );
                              },
                            ),
                          ], theme),
                          const SizedBox(height: 22),
                          _buildMenuSection([
                            _MenuData(
                              icon: Icons.settings,
                              title: 'Setting',
                              subtitle: 'Setting your profile',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppPages.settingsScreen,
                                );
                              },
                            ),

                            _MenuData(
                              icon: Icons.description_outlined,
                              title: 'About Shoply',
                              subtitle: 'App version 1.0.0',
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppPages.aboutScreen,
                                );
                              },
                            ),
                            _MenuData(
                              icon: Icons.logout,
                              title: 'Log Out',
                              subtitle: 'Log out from your account',
                              onTap: () {
                                CustomDialog.showCustomDialog(
                                  context: context,
                                  description:
                                      'Are you sure you want to log out?',
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
                                        LocalStorages.instance.setIsLogin(
                                          isLogin: false,
                                        );
                                        LocalStorageUser.instance
                                            .clearUserData();
                                        context.read<LayoutCubit>().logout();
                                      },
                                    ),
                                  ],
                                );
                              },
                            ),
                          ], theme),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // _buildBottomNavigation(),
          ],
        ),
      ),
    );
  }
}
