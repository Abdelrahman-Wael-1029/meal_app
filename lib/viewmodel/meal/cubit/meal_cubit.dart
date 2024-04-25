import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/data/model/meal.dart';
import 'package:meal_app/repository/meal/meal_repository.dart';
import 'package:meal_app/viewmodel/meal/cubit/meal_state.dart';

class MealCubit extends Cubit<MealState>{
  final MealRepository mealRepository;
  
  List<Meal> meals = [];
  Meal? ranodomMeal;
  Meal? seletedMeal;
  
  MealCubit(this.mealRepository) : super(MealInitState());

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

  void getMealsByCategory(String category) {
    emit(MealLoading());
    try {
      mealRepository.getMealsByCategory(category).then((value) {
        meals = value;
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