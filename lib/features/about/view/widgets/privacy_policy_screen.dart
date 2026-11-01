import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const Color primaryGreen = Color(0xFF0A5C43);

  static const List<_PolicySection> _sections = [
    _PolicySection(
      title: 'Information We Collect',
      body:
          'Account details, delivery addresses, and order information help us provide our services.',
    ),
    _PolicySection(
      title: 'How We Use Information',
      body:
          'We use information to manage your account, process orders, and respond to support requests.',
    ),
    _PolicySection(
      title: 'Sharing Information',
      body:
          'Service providers may receive the information needed to complete your order.',
    ),
    _PolicySection(
      title: 'Your Choices',
      body: 'You can update your profile or contact us about your information.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Privacy Policy'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(22, 12, 22, 14),
                children: [
                  Center(
                    child: Container(
                      width: 112,
                      height: 112,
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.verified_user_outlined,
                        size: 66,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Your privacy matters',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    'Last updated: October 16, 2026',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xFF62656A)),
                  ),
                  const SizedBox(height: 30),
                  ...List.generate(_sections.length, (index) {
                    final section = _sections[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 23),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}.',
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  section.title,
                                  style: TextStyle(
                                    color: theme.primaryColor,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  section.body,
                                  style: const TextStyle(
                                    color: Color(0xFF484B50),
                                    fontSize: 15,
                                    height: 1.48,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
              child: Column(
                children: [
                  Divider(color: theme.dividerColor, height: 1),
                  const SizedBox(height: 10),
                  Text(
                    'Privacy Policy.',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PolicySection {
  final String title;
  final String body;

  const _PolicySection({required this.title, required this.body});
}
