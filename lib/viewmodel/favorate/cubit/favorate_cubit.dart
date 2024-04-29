import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/data/model/favorate.dart';
import 'package:meal_app/repository/favorate/favorate_repository.dart';
import 'package:meal_app/viewmodel/favorate/cubit/favorate_state.dart';

class FavorateCubit extends Cubit<FavorateState> {
  double total = 0;
  final FavorateRepository favorateRepository;
  List<Favorate> ?favorates;
  FavorateCubit({
    required this.favorateRepository,
  }) : super(InitState());

  void addFavorate(Favorate data) {
    try {
      emit(FavorateLoading());
      favorateRepository.addFavorate(data).then((value) {
        emit(FavorateAdd());
        getFavorates();
      });
    } catch (e) {
      emit(FavorateError(e.toString()));
    }
  }

  void getFavorates() {
    try {
      favorates = [];
      emit(FavorateLoading());
      favorateRepository.getFavorates().then((value) {
        favorates = List<Favorate>.from(value);
        emit(FavorateSuccess());
      });
    } catch (e) {
      emit(FavorateError(e.toString()));
    }
  }

  void deleteFavorate(int index) {
    try {
      emit(FavorateLoading());
      favorateRepository.deleteFavorate(index).then((value) {
        emit(FavorateDelete());
        getFavorates();
      });
    } catch (e) {
      emit(FavorateError(e.toString()));
    }
  }

  void clearFavorate() {
    try {
      emit(FavorateLoading());
      favorateRepository.clearFavorate().then((value) {
        emit(FavorateClear());
        getFavorates();
      });
    } catch (e) {
      emit(FavorateError(e.toString()));
    }
  }


  void updateFavorate(int index, Favorate data) {
    try {
      emit(FavorateLoading());
      favorateRepository.updateFavorate(index, data).then((value) {
        emit(FavorateUpdate());
        getFavorates();
      });
    } catch (e) {
      emit(FavorateError(e.toString()));
    }
  }
}
