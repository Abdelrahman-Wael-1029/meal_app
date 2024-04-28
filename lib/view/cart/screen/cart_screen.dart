import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/common/widget/image.dart';
import 'package:meal_app/core/value_manager.dart';
import 'package:meal_app/viewmodel/cart/cubit/cart_cubit.dart';
import 'package:meal_app/viewmodel/cart/cubit/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    var cartCubit = context.read<CartCubit>();
    if (cartCubit.carts == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.all(PaddingManager.p8),
        child: SingleChildScrollView(
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (cartCubit.carts!.isNotEmpty) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>  SizedBox(
                    height: SizeManager.s8,
                  ),
                  itemCount: cartCubit.carts!.length,
                  itemBuilder: (context, index) {
                    var cart = cartCubit.carts![index];
                    int quantity = cart.quantity;

                    return Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 4,
                      surfaceTintColor: Theme.of(context).primaryColor,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            child: getImage(
                              url: cart.imageUrl,
                            ),
                          ),
                          SizedBox(
                            width: SizeManager.s4,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  cart.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(cart.price.toString()),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        if (cart.quantity == 1) return;
                                        cart.quantity = quantity - 1;
                                        cartCubit.updateCart(index, cart);
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text(quantity.toString()),
                                    IconButton(
                                      onPressed: () {
                                        cart.quantity = quantity + 1;
                                        cartCubit.updateCart(index, cart);
                                        setState(() {});
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              cartCubit.deleteCart(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
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
        ),
      ),
    );
  }
}
