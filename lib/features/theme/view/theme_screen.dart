import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/features/theme/view_model/cubit.dart';
import 'package:shoply_app/features/theme/view_model/state.dart';
part 'widgets/custom_radio_list_tile.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final cubit = context.read<ThemeCubit>();
        return Scaffold(
          appBar: CustomAppBar(titleText: 'Theme'),
          body: Column(
            children: [
              RadioGroup(
                onChanged: (value) {
                  cubit.changeTheme(themeMode: value ?? ThemeMode.system);
                },
                groupValue: cubit.themeMode,
                child: CustomRadioListTile(
                  title: 'Light',
                  value: ThemeMode.light,
                  theme: theme,
                ),
              ),
              RadioGroup(
                onChanged: (value) {
                  cubit.changeTheme(themeMode: value ?? ThemeMode.system);
                },
                groupValue: cubit.themeMode,
                child: CustomRadioListTile(
                  title: 'Dark',
                  value: ThemeMode.dark,
                  theme: theme,
                ),
              ),
              RadioGroup(
                onChanged: (value) {
                  cubit.changeTheme(themeMode: value ?? ThemeMode.system);
                },
                groupValue: cubit.themeMode,
                child: CustomRadioListTile(
                  title: 'System',
                  value: ThemeMode.system,
                  theme: theme,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
