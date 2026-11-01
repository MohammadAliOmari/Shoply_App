import 'package:flutter/material.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_button.dart';
import 'package:shoply_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:shoply_app/features/forgot_password/view/widgets/app_regex.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _supportEmailController = TextEditingController(
    text: 'support@shoply.example',
  );
  String? _subject;

  final List<String> _subjects = const [
    'Order inquiry',
    'Shipping & delivery',
    'Returns & refunds',
    'Payment issue',
    'Account support',
    'Other',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Widget _fieldLabel(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 7),
    child: Text(
      label,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Contact Us'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 12, 22, 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      Icons.headset_mic_outlined,
                      size: 66,
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'How can we help?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Send us a message. We’re here for you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                CustomTextFormField(
                  controller: _supportEmailController,
                  hinText: 'Email',
                  prefixIcon: const Icon(Icons.mail_outline),
                ),
                const SizedBox(height: 19),
                _fieldLabel('Full Name'),
                CustomTextFormField(
                  controller: _nameController,
                  hinText: 'Enter your name',
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Please enter your name'
                      : null,
                ),
                const SizedBox(height: 17),
                _fieldLabel('Email'),
                CustomTextFormField(
                  controller: _emailController,
                  hinText: 'Enter your email',
                  validator: (value) {
                    final email = value?.trim() ?? '';
                    if (email.isEmpty) return 'Please enter your email';
                    if (AppRegex.emailRegex.hasMatch(email)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 17),
                _fieldLabel('Subject'),
                DropdownButtonFormField<String>(
                  initialValue: _subject,
                  hint: Text(
                    'Choose a subject',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theme.cardColor,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 15,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(color: Colors.redAccent),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                      borderSide: const BorderSide(color: Colors.redAccent),
                    ),
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                    size: 25,
                  ),
                  items: _subjects
                      .map(
                        (subject) => DropdownMenuItem(
                          value: subject,
                          child: Text(subject),
                        ),
                      )
                      .toList(),
                  onChanged: (value) => setState(() => _subject = value),
                  validator: (value) =>
                      value == null ? 'Please choose a subject' : null,
                ),
                const SizedBox(height: 17),
                _fieldLabel('Message'),
                CustomTextFormField(
                  controller: _messageController,
                  hinText: 'write your message...',
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Please enter your message'
                      : null,
                  maxLines: 4,
                ),
                const SizedBox(height: 17),
                CustomButton(
                  buttonText: 'Send Message',
                  onPressed: () {},
                  fontSize: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
