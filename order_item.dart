import 'menu_item.dart';

class OrderItem {
  final MenuItem item;
  int qty;
  String? note;
  OrderItem({required this.item, this.qty = 1, this.note});
  int get lineTotal => item.price * qty;
  Map<String, dynamic> toJson() => {
        "id": item.id,
        "name": item.name,
        "qty": qty,
        "price": item.price,
        "note": note ?? "",
      };
}
