import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/core/local/local_storage.dart';
import 'package:shoply_app/features/splash/view_model/state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitState());

  void goNextPage() async {
    bool isShowOnboarding = LocalStorage.instance.getShowOnboarding();

    await Future.delayed(Duration(seconds: 1)).then((_) {
      if (isShowOnboarding) {
        emit(SplashLoginPageState());
      } else {
        emit(SplashOnBoardPageState());
      }
    });
  }
}
