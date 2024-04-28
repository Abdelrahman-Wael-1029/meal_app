import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/data/model/cart.dart';
import 'package:meal_app/repository/cart/cart_repository.dart';
import 'package:meal_app/viewmodel/cart/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  double total = 0;
  final CartRepository cartRepository;
  List<Cart> ?carts;
  CartCubit({
    required this.cartRepository,
  }) : super(InitState());

  void addCart(Cart data) {
    try {
      emit(CartLoading());
      cartRepository.addCart(data).then((value) {
        emit(CartAdd());
        getCart();
      });
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void setTotal() {
    total = 0;
    for (var item in carts!) {
      total += item.price * item.quantity;
    }
  }

  void getCart() {
    try {
      carts = [];
      emit(CartLoading());
      cartRepository.getCart().then((value) {
        carts = List<Cart>.from(value);
        setTotal();
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
        getCart();
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
        getCart();
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
        getCart();
      });
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
}
