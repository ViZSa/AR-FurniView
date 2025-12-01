class FurnitureItem {
  final String id;
  final String name;
  final String description;
  final String category;
  final double price;
  final String imageUrl;
  final String modelUrl;
  final List<String> colors;
  final Map<String, double> dimensions;
  bool isFavorite;

  FurnitureItem({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.modelUrl,
    required this.colors,
    required this.dimensions,
    this.isFavorite = false,
  });

  factory FurnitureItem.fromJson(Map<String, dynamic> json) {
    return FurnitureItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      modelUrl: json['modelUrl'],
      colors: List<String>.from(json['colors']),
      dimensions: Map<String, double>.from(json['dimensions']),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'modelUrl': modelUrl,
      'colors': colors,
      'dimensions': dimensions,
      'isFavorite': isFavorite,
    };
  }

  FurnitureItem copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    double? price,
    String? imageUrl,
    String? modelUrl,
    List<String>? colors,
    Map<String, double>? dimensions,
    bool? isFavorite,
  }) {
    return FurnitureItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      modelUrl: modelUrl ?? this.modelUrl,
      colors: colors ?? this.colors,
      dimensions: dimensions ?? this.dimensions,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
