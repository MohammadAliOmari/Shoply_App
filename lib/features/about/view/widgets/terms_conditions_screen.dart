import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  static const Color primaryGreen = Color(0xFF0A5C43);

  static const List<_TermsSection> _sections = [
    _TermsSection(
      title: 'Using Your Account',
      body:
          'Keep your account information accurate and your sign-in details secure.',
    ),
    _TermsSection(
      title: 'Orders & Payments',
      body:
          'Review prices, availability, and payment details before placing your order.',
    ),
    _TermsSection(
      title: 'Shipping & Delivery',
      body: 'Delivery estimates and charges are shown during checkout.',
    ),
    _TermsSection(
      title: 'Returns & Refunds',
      body:
          'Review the return conditions provided with your order before requesting a return.',
    ),
    _TermsSection(
      title: 'Contact Us',
      body: 'For questions, visit Contact Us in the app.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Terms & Conditions'),
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
                        Icons.description_outlined,
                        size: 66,
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Shopping with Shoply',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.7,
                    ),
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
                      padding: const EdgeInsets.only(bottom: 22),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}.',
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
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
                                    fontWeight: FontWeight.w800,
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
                    'Terms & Conditions.',
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

class _TermsSection {
  final String title;
  final String body;

  const _TermsSection({required this.title, required this.body});
}
