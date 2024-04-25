sealed class MealState{}

final class MealInitState extends MealState{}

final class MealLoading extends MealState{}

final class MealSuccess extends MealState{}

final class MealError extends MealState{
  final String message;
  MealError(this.message);
}