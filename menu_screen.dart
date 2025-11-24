import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/menu_card.dart';
import '../models/menu_item.dart';
import '../providers/order_provider.dart';

final List<MenuItem> demoMenu = [
  MenuItem(id: '1', name: 'Fried Rice', category: 'Mains', price: 900),
  MenuItem(id: '2', name: 'Noodles', category: 'Mains', price: 850),
  MenuItem(id: '3', name: 'Coke', category: 'Drinks', price: 150),
  MenuItem(id: '4', name: 'Tea', category: 'Drinks', price: 80),
  MenuItem(id: '5', name: 'Ice Cream', category: 'Desserts', price: 300),
];

class MenuScreen extends StatelessWidget {
  final String category;
  const MenuScreen({this.category = "All", Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    final items = category == "All"
        ? demoMenu
        : demoMenu.where((m) => m.category == category).toList();

    return GridView.count(
      padding: EdgeInsets.all(12),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: items.map((m) => MenuCard(
        item: m,
        onTap: () {
          _showAddDialog(context, m);
        },
      )).toList(),
    );
  }

  void _showAddDialog(BuildContext ctx, MenuItem m) {
    showDialog(
      context: ctx,
      builder: (c) {
        int qty = 1;
        TextEditingController noteCtrl = TextEditingController();
        return AlertDialog(
          title: Text(m.name),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Price: Rs \${m.price}"),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: ()=> setState(()=> qty = (qty>1?qty-1:1)), icon: Icon(Icons.remove)),
                      Text(qty.toString(), style: TextStyle(fontSize: 18)),
                      IconButton(onPressed: ()=> setState(()=> qty++), icon: Icon(Icons.add)),
                    ],
                  ),
                  TextField(controller: noteCtrl, decoration: InputDecoration(labelText: 'Note (optional)')),
                ],
              );
            }
          ),
          actions: [
            TextButton(onPressed: ()=> Navigator.pop(c), child: Text('Cancel')),
            ElevatedButton(onPressed: (){
              final provider = Provider.of<OrderProvider>(ctx, listen:false);
              for(int i=0;i<qty;i++) provider.addItem(m);
              Navigator.pop(c);
            }, child: Text('Add'))
          ],
        );
      }
    );
  }
}
