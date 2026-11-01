part of '../singup_screen.dart';

class _SignupHeader extends StatelessWidget {
  const _SignupHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        return Column(
          children: [
            Text(
              'Join us and start shopping',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade500,
              ),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.shade300,
                  child: cubit.profileImage == null
                      ? Icon(
                          Icons.person_outline_rounded,
                          size: 90,
                          color: Colors.grey.shade700,
                        )
                      : ClipOval(
                          child: Image.file(
                            cubit.profileImage!,
                            width: 140,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
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
                      child: Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.white,
                      ),
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
      },
    );
  }
}
