import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply_app/features/cart/view/cart_screen.dart';
import 'package:shoply_app/features/categories/view/categories_screen.dart';
import 'package:shoply_app/features/home/view/home_screen.dart';
import 'package:shoply_app/features/layout/view_model/state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitState());
  int selectedIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CategoriesScreen(),
    Text('Favorit'),
    CartScreen(),
  ];
  List<String> appbarTitle = ['', 'Categories', 'Favorite', 'Cart'];
  void changeNavBarIndex(int index) {
    selectedIndex = index;
    emit(LayoutChangeNavBarIndexState());
  }
}
