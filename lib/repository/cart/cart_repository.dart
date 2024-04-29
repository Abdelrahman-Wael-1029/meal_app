import '../../common/local/hive_helper.dart';
import '../../data/model/cart.dart';

class CartRepository{
  Future<void> addCart(Cart data) async {

    // check if data is already exist
    var cart = await getCart();
    if(cart.isNotEmpty){
      for (var item in cart) {
        if(item.id == data.id){
          data.quantity = item.quantity + data.quantity;
          await updateCart(cart.indexOf(item), data);
          return;
        }
      }
    }
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