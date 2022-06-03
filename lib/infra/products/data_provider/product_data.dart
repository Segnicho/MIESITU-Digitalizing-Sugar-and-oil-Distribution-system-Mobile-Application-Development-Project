import 'dart:convert';
import 'package:labpract/domain/poducts/models/product.dart';
import 'package:http/http.dart' as http;

class ProductDataProvider {
  String baseUrl = 'http://127.0.0.1:7000';
  Future<Product> createProduct(Product product) async {
    final response = await http.post(
      Uri.parse("$baseUrl/api/products/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'product_name': product.product_name,
        'product_price': product.product_price,
      }),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("2oooooooooooooooo");
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create product.');
    }
  }

  Future<List<Product>> getProduct() async {
    final response = await http.get(Uri.parse("$baseUrl/api/products/"));
    if (response.statusCode == 200) {
      final products = jsonDecode(response.body) as List;
      return products.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<void> deleteProduct(String id) async {
    final http.Response response = await http.delete(
      Uri.parse("$baseUrl/api/pruducts/'$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Failed to delete product.');
    }
  }

  Future<void> updateProduct(Product product) async {
    final http.Response response = await http.put(
      Uri.parse("$baseUrl/api/products/${product.id}"),
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      // },
      body: jsonEncode(<String, dynamic>{
        'id': product.id,
        'product_name': product.product_name,
        'product_price': product.product_price,
      }),
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to update product.');
    }
  }
}
