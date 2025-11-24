import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../models/order_item.dart';
import '../services/api_service.dart';

class OrderProvider extends ChangeNotifier {
  int? tableNo;
  final List<OrderItem> _items = [];

  List<OrderItem> get items => List.unmodifiable(_items);

  void setTable(int t){
    tableNo = t;
    notifyListeners();
  }

  void addItem(MenuItem m){
    final found = _items.where((oi) => oi.item.id == m.id).toList();
    if (found.isNotEmpty) {
      found.first.qty++;
    } else {
      _items.add(OrderItem(item: m));
    }
    notifyListeners();
  }

  void removeItem(OrderItem oi){
    _items.remove(oi);
    notifyListeners();
  }

  void changeQty(OrderItem oi, int delta){
    oi.qty += delta;
    if (oi.qty <= 0) _items.remove(oi);
    notifyListeners();
  }

  int get total => _items.fold(0, (s, e) => s + e.lineTotal);

  Future<bool> sendToKitchen() async {
    if (tableNo == null || _items.isEmpty) return false;
    final orderPayload = {
      "table": tableNo,
      "items": _items.map((e) => e.toJson()).toList(),
      "timestamp": DateTime.now().toIso8601String(),
    };
    final ok = await ApiService.sendOrder(orderPayload);
    if (ok) {
      clear();
    }
    return ok;
  }

  void clear(){
    _items.clear();
    tableNo = null;
    notifyListeners();
  }
}
