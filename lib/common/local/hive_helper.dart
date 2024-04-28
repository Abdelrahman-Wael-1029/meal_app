// for add, get, delete, update data in hive
import 'package:hive/hive.dart';

class HiveHelper {
  static Future<void> putData(String boxName, key, value) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, value);
  }

  static Future<dynamic> addData(String boxName, data) async {
    var box = await Hive.openBox(boxName);
    return box.add(data);
  }

  static Future<List> getData(String boxName) async {
    var box = await Hive.openBox(boxName);
    var data = [];
    for (var i = 0; i < box.length; i++) {
      data.add(box.getAt(i));
    }
    return data;
  }

  static Future<dynamic> getDataByKey(String boxName, key) async {
    var box = await Hive.openBox(boxName);
    return box.get(key);
  }

  static Future<void> deleteData(String boxName, int index) async {
    var box = await Hive.openBox(boxName);
    await box.deleteAt(index);
  }

  static Future<void> updateData(
      String boxName, int index, dynamic data) async {
    var box = await Hive.openBox(boxName);
    await box.putAt(index, data);
  }

  static Future<void> clearData(String boxName) async {
    var box = await Hive.openBox(boxName);
    await box.clear();
  }
}
