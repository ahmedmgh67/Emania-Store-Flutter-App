import 'package:http/http.dart' as http;
import 'dart:convert';
Future<dynamic> products()async {
  var request = await http.get("url");
  return jsonDecode(request.body);
}