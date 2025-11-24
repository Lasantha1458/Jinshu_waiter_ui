import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static String serverUrl = "http://192.168.1.100:8000";

  static Future<bool> sendOrder(Map<String,dynamic> order) async {
    final uri = Uri.parse("$serverUrl/new_order");
    try {
      final res = await http.post(uri,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(order)).timeout(Duration(seconds: 8));
      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        print("Server error: \${res.statusCode} \${res.body}");
        return false;
      }
    } catch (e) {
      print("Send order error: \$e");
      return false;
    }
  }
}
