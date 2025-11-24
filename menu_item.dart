class MenuItem {
  final String id;
  final String name;
  final String category;
  final int price;
  final String? image;

  MenuItem({required this.id, required this.name, required this.category, required this.price, this.image});

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        id: json['id'].toString(),
        name: json['name'],
        category: json['category'],
        price: json['price'],
        image: json['image'],
      );
}
