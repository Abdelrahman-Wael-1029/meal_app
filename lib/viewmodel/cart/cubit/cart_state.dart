sealed class CartState {}

final class InitState extends CartState {}

final class CartLoading extends CartState {}

final class CartSuccess extends CartState {}

final class CartError extends CartState {
  final String message;
  CartError(this.message);
}

final class CartDelete extends CartState {}

final class CartUpdate extends CartState {}

final class CartAdd extends CartState {}

final class CartClear extends CartState {}

