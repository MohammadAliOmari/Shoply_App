part of '../profile_screen.dart';

class _BuildProfileHeader extends StatefulWidget {
  const _BuildProfileHeader();

  @override
  State<_BuildProfileHeader> createState() => _BuildProfileHeaderState();
}

class _BuildProfileHeaderState extends State<_BuildProfileHeader> {
  void refreshData() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 104,
            height: 104,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.primaryColor,
              border: Border.all(color: theme.dividerColor, width: 4),
            ),
            child: ClipOval(
              child: CustomCachedImageNetwork(
                image: LocalStorageUser.instance.profileImage,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocalStorageUser.instance.fullName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  '@${LocalStorageUser.instance.userName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 7),
                Text(
                  LocalStorageUser.instance.email,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () async {
              final result = await Navigator.pushNamed(
                context,
                AppPages.editProfileScreen,
              );
              if (!context.mounted) return;
              if (result == true) {
                setState(() {});
              }
            },
            child: Icon(Icons.edit_note_outlined, size: 30),
          ),
        ],
      ),
    );
  }
}
