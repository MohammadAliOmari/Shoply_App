import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/features/about/view/widgets/contact_us_screen.dart';
import 'package:shoply_app/features/about/view/widgets/privacy_policy_screen.dart';
import 'package:shoply_app/features/about/view/widgets/terms_conditions_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(titleText: 'About'),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Shoply logo
            Image(
              image: AssetImage(AppImages.shoplyLogo),
              width: 300,
              color: theme.primaryColor,
            ),
            const SizedBox(height: 4),

            Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            const SizedBox(height: 12),

            Text(
              'Your everyday shopping\ncompanion.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                height: 1.4,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // About menu items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _AboutMenuItem(
                    icon: Icons.mail_outline_rounded,
                    title: 'Contact Us',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ContactUsScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 7),
                  _AboutMenuItem(
                    icon: Icons.description_outlined,
                    title: 'Privacy Policy',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 7),
                  _AboutMenuItem(
                    icon: Icons.shield_outlined,
                    title: 'Terms & Conditions',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TermsConditionsScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            const Spacer(),

            const Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Text(
                'Made for better shopping.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _AboutMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Material(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, size: 20),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                size: 23,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
