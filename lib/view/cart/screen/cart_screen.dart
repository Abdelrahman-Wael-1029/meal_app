import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/value_manager.dart';
import '../widget/list_card_item.dart';
import '../../../viewmodel/cart/cubit/cart_cubit.dart';
import '../../../viewmodel/cart/cubit/cart_state.dart';

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
    return Padding(
      padding: EdgeInsets.all(PaddingManager.p8),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (cartCubit.carts == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (cartCubit.carts!.isEmpty) {
            return const Center(
              child: Text('Cart is empty'),
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
