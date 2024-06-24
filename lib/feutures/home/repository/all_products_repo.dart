import 'dart:convert';
import 'package:http/http.dart' as http;

class AllProductsRepo {
  getAllProducts(String uri) async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    }
  }

  getAllProductsName(List categories, String uri) async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      categories.addAll(data);
    }
  }

  getProductByCategory(List<dynamic> categories, String uri) async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      categories.add(data);
    }
  }
}
