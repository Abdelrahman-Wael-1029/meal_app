import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/data/model/cart.dart';
import 'package:meal_app/repository/cart/cart_repository.dart';
import 'package:meal_app/viewmodel/cart/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  double total = 0;
  final CartRepository cartRepository;
  List<Cart> carts = [];
  CartCubit({
    required this.cartRepository,
  }) : super(InitState());

  void addCart(Cart data) {
    try {
      emit(CartLoading());
      cartRepository.addCart(data).then((value) {
        emit(CartAdd());
      });
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void getCart() {
    try {
      emit(CartLoading());
      cartRepository.getCart().then((value) {
        carts = List<Cart>.from(value);
        emit(CartSuccess());
      });
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void deleteCart(int index) {
    try {
      emit(CartLoading());
      cartRepository.deleteCart(index).then((value) {
        emit(CartDelete());
      });
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void clearCart() {
    try {
      emit(CartLoading());
      cartRepository.clearCart().then((value) {
        emit(CartClear());
      });
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }


  void updateCart(int index, Cart data) {
    try {
      emit(CartLoading());
      cartRepository.updateCart(index, data).then((value) {
        emit(CartUpdate());
      });
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
