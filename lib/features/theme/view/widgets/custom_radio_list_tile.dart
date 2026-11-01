part of '../theme_screen.dart';

class CustomRadioListTile extends StatelessWidget {
  const CustomRadioListTile({
    super.key,
    required this.theme,
    required this.title,
    required this.value,
  });
  final String title;
  final ThemeMode value;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(fontSize: 18),
      ),
      value: value,
    );
  }
}
