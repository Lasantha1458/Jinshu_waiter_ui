import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onTap;
  const MenuCard({required this.item, required this.onTap, Key? key}): super(key:key);

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              child: item.image != null
                ? Image.asset(item.image!, fit: BoxFit.cover)
                : Icon(Icons.fastfood, size: 48),
            ),
            SizedBox(height: 8),
            Text(item.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            Text("Rs \${item.price}", style: TextStyle(fontSize: 14)),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
