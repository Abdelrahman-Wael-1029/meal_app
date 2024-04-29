import '../../common/local/hive_helper.dart';

import '../../data/model/favorite.dart';

class FavoriteRepository {
  Future<void> addFavorite(Favorite data) async {
    // check if data is already exist
    var favorite = await getFavorites();
    if (favorite.isNotEmpty) {
      for (var item in favorite) {
        if (item.id == data.id) {
          return;
        }
      }
    }
    await HiveHelper.addData('favorite', data);
  }

  Future<List> getFavorites() async {
    return await HiveHelper.getData('favorite');
  }

  Future<void> updateFavorite(int index, Favorite data) async {
    await HiveHelper.updateData('favorite', index, data);
  }

  Future<void> deleteFavorite(int index) async {
    await HiveHelper.deleteData('favorite', index);
  }

  Future<void> clearFavorite() async {
    await HiveHelper.clearData('favorite');
  }
}
