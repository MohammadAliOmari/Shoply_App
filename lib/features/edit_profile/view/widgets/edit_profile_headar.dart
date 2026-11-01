part of '../edit_profile_screen.dart';

class _EditProfileHeader extends StatelessWidget {
  const _EditProfileHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final cubit = context.read<EditProfileCubit>();
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey.shade300,
              child: cubit.profileImage != null
                  ? ClipOval(
                      child: Image.file(
                        cubit.profileImage!,
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    )
                  : LocalStorageUser.instance.profileImage.isNotEmpty
                  ? ClipOval(
                      child: CustomCachedImageNetwork(
                        image: LocalStorageUser.instance.profileImage,
                        width: 140,
                        height: 140,
                        fit: BoxFit.cover,
                        errorWidget: Icon(
                          Icons.person_outline_rounded,
                          size: 90,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    )
                  : Icon(
                      Icons.person_outline_rounded,
                      size: 90,
                      color: Colors.grey.shade700,
                    ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  cubit.pickImage();
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: theme.primaryColor,
                  child: Icon(Icons.camera_alt, size: 20, color: Colors.white),
                ),
              ),
            ),
            if (cubit.profileImage != null)
              Positioned(
                bottom: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    cubit.deleteImage();
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red.shade400,
                    child: Icon(
                      Icons.delete_outline_rounded,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
