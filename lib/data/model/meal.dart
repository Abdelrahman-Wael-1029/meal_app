class Meal {
  String id;
  String name;
  String category;
  double price;
  String imageUrl;
  List<String> tags;
  String Instructions;

  Meal({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.tags,
    required this.Instructions,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      price: 1,
      category: json['strCategory'],
      imageUrl: json['strMealThumb'],
      tags: json['strTags'] != null?List<String>.from(json['strTags'].split(',')):[],
      Instructions: json['strInstructions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'strMeal': name,
      'strCategory': category,
      'price': price,
      'strMealThumb': imageUrl,
      'strTags': tags.join(', '),
      'strInstructions': Instructions,
    };
  }

  @override
  String toString() {
    return 'Meal{id: $id, name: $name, price: $price, category: $category, imageUrl: $imageUrl, tags: $tags, Instructions: $Instructions}';
  }
}
