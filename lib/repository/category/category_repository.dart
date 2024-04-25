import 'package:flutter/material.dart';

import '../../data/api/category/category_api.dart';
import '../../data/model/category.dart';

class CategoryRepository {
  final CategoryApi categoryApi;

  CategoryRepository(this.categoryApi);

  Future<List<Category>> getCategories() async {
    try {
      final response = await categoryApi.getCategories();
      return (response.data['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

}
