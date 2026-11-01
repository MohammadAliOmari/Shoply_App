import 'package:flutter/material.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
part 'widgets/row_icon.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Settings'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            _RowIcon(
              iconData: Icons.dark_mode_outlined,
              title: 'Theme',
              onTap: () {
                Navigator.pushNamed(context, AppPages.themeScreen);
              },
            ),
            SizedBox(height: 45),
            _RowIcon(
              title: 'Change Your Password',
              iconData: Icons.lock_outline_rounded,
              onTap: () {
                Navigator.pushNamed(context, AppPages.changePasswordScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
