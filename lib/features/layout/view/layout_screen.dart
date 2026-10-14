import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/local/local_storge_user.dart';
import 'package:shoply_app/core/utils/images/app_images.dart';
import 'package:shoply_app/core/utils/theme/app_colors.dart';
import 'package:shoply_app/core/utils/widgets/custom_app_bar.dart';
import 'package:shoply_app/core/utils/widgets/custom_cashed_image.dart';
import 'package:shoply_app/core/utils/widgets/custom_list_tile.dart';
import 'package:shoply_app/features/layout/view_model/cubit.dart';
import 'package:shoply_app/features/layout/view_model/state.dart';
part 'widget/custom_bottom_nav_bar.dart';
part 'widget/layout_app_bar.dart';
part 'widget/custom_drawer.dart';

// part 'widget/custom_drawer.dart';
class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: Scaffold(
        drawer: _LayoutDrawer(),
        appBar: _LayoutAppBar(),
        bottomNavigationBar: _CustomBottmNavBar(),
        body: BlocBuilder<LayoutCubit, LayoutState>(
          builder: (context, state) {
            final cubit = context.read<LayoutCubit>();
            return cubit.pages[cubit.selectedIndex];
          },
        ),
      ),
    );
  }
}
