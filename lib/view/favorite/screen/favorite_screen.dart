import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/core/value_manager.dart';
import 'package:meal_app/view/cart/widget/list_card_item.dart';
import 'package:meal_app/viewmodel/favorate/cubit/favorate_cubit.dart';
import 'package:meal_app/viewmodel/favorate/cubit/favorate_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  static const routeName = '/favorates';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavorateCubit>().getFavorates();
  }

  @override
  Widget build(BuildContext context) {
    var favorateCubit = context.read<FavorateCubit>();
    if (favorateCubit.favorates == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
      padding: EdgeInsets.all(PaddingManager.p8),
      child: BlocBuilder<FavorateCubit, FavorateState>(
        builder: (context, state) {
          if (favorateCubit.favorates == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(favorateCubit.favorates!.isEmpty) {
            return const Center(child: Text('No favorates yet'),);
          }
          return Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: SizeManager.s8,
                ),
                itemCount: favorateCubit.favorates!.length,
                itemBuilder: (context, index) {
                  var favorate = favorateCubit.favorates![index];
                  return listCardItem(
                    context: context,
                    model: favorate,
                    onDelete: () {
                      favorateCubit.deleteFavorate(index);
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
