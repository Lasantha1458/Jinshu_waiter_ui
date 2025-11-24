import 'package:flutter/material.dart';
import 'screens/table_screen.dart';
import 'screens/category_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/cart_screen.dart';

class JinZhuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jīnzhú Waiter POS',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/tables',
      routes: {
        '/tables': (_) => TableScreen(),
        '/categories': (_) => CategoryScreen(),
        '/menu': (_) => MenuScreen(),
        '/cart': (_) => CartScreen(),
      },
    );
  }
}
