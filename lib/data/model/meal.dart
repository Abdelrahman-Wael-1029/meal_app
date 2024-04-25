class Meal {
  String id;
  String name;
  String category;
  double price;
  String imageUrl;
  List<String> tags;

  Meal({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.tags,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      price: 0.0,
      category: json['strCategory'],
      imageUrl: json['strMealThumb'],
      tags: json['strTags'] != null?List<String>.from(json['strTags'].split(', ')):[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'strMeal': name,
      'strCategory': category,
      'price': 0.0,
      'strMealThumb': imageUrl,
      'strTags': tags.join(', '),
    };
  }

  @override
  String toString() {
    return 'Meal{id: $id, name: $name, price: $price, category: $category, imageUrl: $imageUrl, tags: $tags}';
  }
}
