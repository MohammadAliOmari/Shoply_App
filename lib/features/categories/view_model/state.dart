abstract class CategoriesState {}

class CategoriesInitState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSucsessState extends CategoriesState {}

class CategoriesErrorState extends CategoriesState {
  final String errorMassege;

  CategoriesErrorState({required this.errorMassege});
}
