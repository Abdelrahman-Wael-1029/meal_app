import 'package:meal_app/common/local/hive_helper.dart';
import 'package:meal_app/data/model/cart.dart';

class CartRepository{
  Future<void> addCart(Cart data) async {
    await HiveHelper.addData('cart', data);
  }

  Future<List> getCart() async {
    return await HiveHelper.getData('cart');
  }

  Future<void> updateCart(int index, Cart data) async {
    await HiveHelper.updateData('cart', index, data);
  }

  Future<void> deleteCart(int index) async {
    await HiveHelper.deleteData('cart', index);
  }

  Future<void> clearCart() async {
    await HiveHelper.clearData('cart');
  }
}