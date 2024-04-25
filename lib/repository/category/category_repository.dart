import '../../data/api/category/category_api.dart';
import '../../data/model/category.dart';

class CategoryRepository {
  final CategoryApi categoryApi;

  CategoryRepository(this.categoryApi);

  Future<List<Category>> getCategories() async {
    final response = await categoryApi.getCategories();
    return (response.data['categories'] as List)
        .map((e) => Category.fromJson(e))
        .toList();
  }
}
