import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/data/model/category.dart';
import 'package:meal_app/repository/category/category_repository.dart';
import 'package:meal_app/viewmodel/category/cubit/category_states.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository repository;

  List<Category> categories = [];

  CategoryCubit(this.repository) : super(CategoryInitState());

  void getCategories() {
    emit(CategoryLoading());
    try {
      repository.getCategories().then((value) {
        categories = value;
        emit(CategorySuccess());
      });
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
