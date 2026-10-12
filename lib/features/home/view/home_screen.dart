import 'package:flutter/material.dart';
import 'package:shoply_app/core/local/local_storge_user.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';

import '../../../core/local/local_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () {
            LocalStorages.instance.setIsLogin(isLogin: false);
            LocalStorageUser.instance.clearUserData();
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppPages.loginScreen,
              (route) => false,
            );
          },
          child: Icon(Icons.logout),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocalStorageUser.instance.email),
            Text(LocalStorageUser.instance.fullName),
            Text(LocalStorageUser.instance.userName),
            Text(LocalStorageUser.instance.address),
            Text(LocalStorageUser.instance.uid),
            Text(LocalStorageUser.instance.profileImage),
          ],
        ),
      ),
    );
  }
}
