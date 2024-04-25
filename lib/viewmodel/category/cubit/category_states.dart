import 'package:meal_app/data/model/category.dart';

sealed class CategoryState {}

final class CategoryInitState extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {}

final class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
