class MealCategory{
  String id;
  String name;
  String imageUrl;

  MealCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory MealCategory.fromJson(Map<String, dynamic> json) {
    return MealCategory(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'strMeal': name,
      'strMealThumb': imageUrl,
    };
  }

  @override
  String toString() {
    return 'MealCategory{id: $id, name: $name, imageUrl: $imageUrl}';
  }

}