import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/viewmodel/cart/cubit/cart_cubit.dart';
import 'package:meal_app/viewmodel/cart/cubit/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    var cartCubit = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          print("rebuid cart screen");
          if (cartCubit.carts.isNotEmpty) {
            return ListView.builder(
              itemCount: cartCubit.carts.length,
              itemBuilder: (context, index) {
                var cart = cartCubit.carts[index];
                return ListTile(
                  title: Text(cart.name),
                  subtitle: Text(cart.price.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cartCubit.deleteCart(index);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        },
      ),
    );
  }
}
