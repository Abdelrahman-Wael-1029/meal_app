import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/value_manager.dart';
import '../../cart/widget/list_card_item.dart';
import '../../../viewmodel/favorite/cubit/favorite_cubit.dart';
import '../../../viewmodel/favorite/cubit/favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});
  static const routeName = '/favorites';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    var favoriteCubit = context.read<FavoriteCubit>();
    if (favoriteCubit.favorites == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
      padding: EdgeInsets.all(PaddingManager.p8),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (favoriteCubit.favorites == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(favoriteCubit.favorites!.isEmpty) {
            return const Center(child: Text('No favorites yet'),);
          }
          return Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: SizeManager.s8,
                ),
                itemCount: favoriteCubit.favorites!.length,
                itemBuilder: (context, index) {
                  var favorite = favoriteCubit.favorites![index];
                  return listCardItem(
                    context: context,
                    model: favorite,
                    onDelete: () {
                      favoriteCubit.deleteFavorite(index);
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
