import 'package:meal_app/common/local/hive_helper.dart';

import 'package:meal_app/data/model/favorate.dart';

class FavorateRepository {
  Future<void> addFavorate(Favorate data) async {
    // check if data is already exist
    var favorate = await getFavorates();
    if (favorate.isNotEmpty) {
      for (var item in favorate) {
        if (item.id == data.id) {
          return;
        }
      }
    }
    await HiveHelper.addData('favorate', data);
  }

  Future<List> getFavorates() async {
    return await HiveHelper.getData('favorate');
  }

  Future<void> updateFavorate(int index, Favorate data) async {
    await HiveHelper.updateData('favorate', index, data);
  }

  Future<void> deleteFavorate(int index) async {
    await HiveHelper.deleteData('favorate', index);
  }

  Future<void> clearFavorate() async {
    await HiveHelper.clearData('favorate');
  }
}
