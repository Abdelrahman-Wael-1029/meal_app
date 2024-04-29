import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/favorite.dart';
import '../../../repository/favorite/favorite_repository.dart';
import 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  double total = 0;
  final FavoriteRepository favoriteRepository;
  List<Favorite> ?favorites;
  FavoriteCubit({
    required this.favoriteRepository,
  }) : super(InitState());

  void addFavorite(Favorite data) {
    try {
      emit(FavoriteLoading());
      favoriteRepository.addFavorite(data).then((value) {
        emit(FavoriteAdd());
        getFavorites();
      });
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  void getFavorites() {
    try {
      favorites = [];
      emit(FavoriteLoading());
      favoriteRepository.getFavorites().then((value) {
        favorites = List<Favorite>.from(value);
        emit(FavoriteSuccess());
      });
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  void deleteFavorite(int index) {
    try {
      emit(FavoriteLoading());
      favoriteRepository.deleteFavorite(index).then((value) {
        emit(FavoriteDelete());
        getFavorites();
      });
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  void clearFavorite() {
    try {
      emit(FavoriteLoading());
      favoriteRepository.clearFavorite().then((value) {
        emit(FavoriteClear());
        getFavorites();
      });
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }


  void updateFavorite(int index, Favorite data) {
    try {
      emit(FavoriteLoading());
      favoriteRepository.updateFavorite(index, data).then((value) {
        emit(FavoriteUpdate());
        getFavorites();
      });
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}
