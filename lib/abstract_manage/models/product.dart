class Product {
  final int id;
  final String name;
  final String description;
  final String value;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.value,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      value: map['value'] as String,
    );
  }
}
