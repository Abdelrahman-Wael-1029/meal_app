sealed class FavorateState {}

final class InitState extends FavorateState {}

final class FavorateLoading extends FavorateState {}

final class FavorateSuccess extends FavorateState {}

final class FavorateError extends FavorateState {
  final String message;
  FavorateError(this.message);
}

final class FavorateDelete extends FavorateState {}

final class FavorateUpdate extends FavorateState {}

final class FavorateAdd extends FavorateState {}

final class FavorateClear extends FavorateState {}

