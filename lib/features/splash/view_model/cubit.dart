import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/local/local_storage.dart';
import 'package:shoply_app/core/local/local_storge_user.dart';
import 'package:shoply_app/features/splash/view_model/state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitState());

  Future<void> goNextPage() async {
    bool? isShowOnboarding = LocalStorages.instance.getShowOnboarding();
    bool? isLogin = LocalStorages.instance.getIsLogin();

    await Future.delayed(Duration(seconds: 1)).then((_) async {
      if (isShowOnboarding ?? false) {
        if (isLogin ?? false) {
          final responseLogin = await LocalStorageUser.instance.getUserData();
          LocalStorageUser.instance.setUserinfo(responseLogin: responseLogin);
          emit(SplashHomePageState());
        } else {
          emit(SplashLoginPageState());
        }
      } else {
        await LocalStorageUser.instance.clearUserData();
        emit(SplashOnBoardPageState());
      }
    });
  }
}
