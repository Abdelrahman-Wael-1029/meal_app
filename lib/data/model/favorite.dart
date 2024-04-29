import 'package:hive_flutter/adapters.dart';

part 'favorite.g.dart';

@HiveType(typeId: 2)
class Favorite {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String imageUrl;
  @HiveField(3)
  double price;

  Favorite({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      price: map['price'],
    );
  }

  @override
  String toString() {
    return 'Favorite(id: $id, name: $name, imageUrl: $imageUrl, price: $price)';
  }
}
