import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/core/value_manager.dart';
import 'package:meal_app/view/cart/widget/list_card_item.dart';
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
    return Padding(
      padding: EdgeInsets.all(PaddingManager.p8),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (cartCubit.carts == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Row(
                children: [
                  Text('Total: ${cartCubit.total}',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(PaddingManager.p8),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Checkout'),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(
                    height: SizeManager.s8,
                  ),
                  itemCount: cartCubit.carts!.length,
                  itemBuilder: (context, index) {
                    var cart = cartCubit.carts![index];
                    int quantity = cart.quantity;
                    return listCardItem(
                      context: context,
                      model: cart,
                      onDelete: () {
                        cartCubit.deleteCart(index);
                        setState(() {});
                      },
                      subChild: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: OverflowBar(
                          overflowAlignment: OverflowBarAlignment.center,
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
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
