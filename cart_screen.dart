import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Order Cart')),
      body: Column(
        children: [
          ListTile(
            title: Text('Table: \${provider.tableNo ?? "-"}'),
            subtitle: Text('Items: \${provider.items.length}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.items.length,
              itemBuilder: (_, i){
                final oi = provider.items[i];
                return ListTile(
                  title: Text(oi.item.name),
                  subtitle: Text('Rs \${oi.item.price} x \${oi.qty}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(icon: Icon(Icons.remove), onPressed: ()=> provider.changeQty(oi, -1)),
                      IconButton(icon: Icon(Icons.add), onPressed: ()=> provider.changeQty(oi, 1)),
                      IconButton(icon: Icon(Icons.delete), onPressed: ()=> provider.removeItem(oi)),
                    ],
                  ),
                );
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text('Total: Rs \${provider.total}', style: TextStyle(fontSize: 22)),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: ElevatedButton(
                      child: Text('Send to Kitchen'),
                      onPressed: () async {
                        final ok = await provider.sendToKitchen();
                        final snack = ok ? 'Order sent' : 'Failed to send. Check connection';
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snack)));
                        if (ok) Navigator.pushNamedAndRemoveUntil(context, '/tables', (r)=>false);
                      },
                    )),
                    SizedBox(width: 12),
                    Expanded(child: OutlinedButton(
                      child: Text('Hold'),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Order Held')));
                      },
                    )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
