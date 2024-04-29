sealed class FavoriteState {}

final class InitState extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteSuccess extends FavoriteState {}

final class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError(this.message);
}

final class FavoriteDelete extends FavoriteState {}

final class FavoriteUpdate extends FavoriteState {}

final class FavoriteAdd extends FavoriteState {}

final class FavoriteClear extends FavoriteState {}

