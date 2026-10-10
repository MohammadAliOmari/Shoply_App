import 'package:flutter/material.dart';
import 'package:shoply_app/core/routes/app_pages.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Image(
                  image: AssetImage(AppImages.shoplySplashImage),
                  width: 250,
                  height: 200,
                ),
                Text(
                  'Welcom Back',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Sign to countinue shopping',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hinText: 'Email',
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 5),
                CustomTextFormField(
                  controller: TextEditingController(),
                  hinText: 'Password',
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.grey.shade700,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Text(
                    'ForgotPassword?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  buttonText: 'Login',
                  onPressed: () {},
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppPages.signupScreen);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
