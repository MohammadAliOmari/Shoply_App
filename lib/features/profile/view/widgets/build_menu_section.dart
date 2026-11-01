part of '../profile_screen.dart';

Widget _buildMenuSection(List<_MenuData> items, ThemeData theme) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 18),
    decoration: BoxDecoration(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: theme.dividerColor),
    ),
    child: Column(
      children: List.generate(items.length, (index) {
        final item = items[index];

        return Column(
          children: [
            InkWell(
              onTap: item.onTap,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 17),
                child: Row(
                  children: [
                    _iconCircle(item.icon, size: 60, theme: theme),
                    const SizedBox(width: 17),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item.subtitle,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right,
                      color: Colors.grey,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ),
            if (index != items.length - 1)
              Padding(
                padding: const EdgeInsets.only(left: 77),
                child: Divider(height: 1, color: theme.dividerColor),
              ),
          ],
        );
      }),
    ),
  );
}

Widget _iconCircle(
  IconData icon, {
  double size = 60,
  required ThemeData theme,
}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: theme.cardColor,
      shape: BoxShape.circle,
      border: Border.all(color: theme.dividerColor),
    ),
    child: Icon(icon, color: theme.primaryColor, size: size * 0.48),
  );
}

class _MenuData {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}
