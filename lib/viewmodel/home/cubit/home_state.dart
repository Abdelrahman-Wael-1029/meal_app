sealed class HomeState{}

final class InitState extends HomeState{}

final class MealLoading extends HomeState{}

final class MealSuccess extends HomeState{}

final class MealError extends HomeState{
  final String message;
  MealError(this.message);
}

final class CategoryInitState extends HomeState {}

final class CategoryLoading extends HomeState {}

final class CategorySuccess extends HomeState {}

final class CategoryError extends HomeState {
  final String message;
  CategoryError(this.message);
}

final class ChangeIndex extends HomeState{}