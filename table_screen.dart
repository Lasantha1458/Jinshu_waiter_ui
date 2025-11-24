import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final tables = List.generate(20, (i) => i+1);
    return Scaffold(
      appBar: AppBar(title: Text("Select Table - Jīnzhú Restaurant")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: tables.map((t) => ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[400],
              padding: EdgeInsets.all(16)
            ),
            child: Text("Table \$t", style: TextStyle(fontSize: 18)),
            onPressed: (){
              Provider.of<OrderProvider>(context, listen:false).setTable(t);
              Navigator.pushNamed(context, '/categories');
            },
          )).toList(),
        ),
      ),
    );
  }
}
