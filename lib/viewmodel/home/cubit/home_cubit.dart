import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/category.dart';
import '../../../repository/category/category_repository.dart';
import '../../../data/model/meal.dart';
import '../../../repository/meal/meal_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  int currentIndex = 0;

  final MealRepository mealRepository;
  final CategoryRepository categoryRepository;

  List<Meal> meals = [];
  List<Category> categories = [];
  Meal? ranodomMeal;
  Meal? seletedMeal;

  HomeCubit({required this.mealRepository, required this.categoryRepository})
      : super(InitState());

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }

  void getCategories() {
    emit(CategoryLoading());
    try {
      categoryRepository.getCategories().then((value) {
        categories = value;
        emit(CategorySuccess());
      });
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  void getMeals() {
    emit(MealLoading());
    try {
      mealRepository.getMeals().then((value) {
        meals = value;
        emit(MealSuccess());
      });
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }

  void getMealsBySearch(String search) {
    emit(MealLoading());
    try {
      mealRepository.getMealsBySearch(search).then((value) {
        meals = List<Meal>.from(value);
        emit(MealSuccess());
      });
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }

  void getRandomMeal() {
    emit(MealLoading());
    try {
      mealRepository.getRandomMeal().then((value) {
        ranodomMeal = value;
        emit(MealSuccess());
      });
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }

  void getMealById(String id) {
    emit(MealLoading());
    try {
      mealRepository.getMealById(id).then((value) {
        seletedMeal = value;
        emit(MealSuccess());
      });
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }
}
