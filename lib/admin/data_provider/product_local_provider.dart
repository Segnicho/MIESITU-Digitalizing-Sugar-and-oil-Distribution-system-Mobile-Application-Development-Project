// import 'package:state/admin/data_provider/product_provider.dart';
// import 'package:state/admin/model/product.dart';

// class ProductLocalProvider implements ProductProvider {
//   final List<Product> _products = [
//     for (int i in List.generate(15, (i) => i))
//       Product(
//           description: "Product number $i", priority: i % 6)
//   ];

//   @override
//   addProduct(Product product) async {
//     return _products.add(product);
//   }

//   @override
//   editProduct(int id, Product product) async {
//     int index = -1;
//     for (int i = 0; i < _products.length; i++) {
//       if (_products[i].id == id) {
//         index = i;
//         break;
//       }
//     }
//     if (index == -1) {
//       throw Exception("Product not found");
//     }
//     _products[index] ==
//         Product(
//           description: product.description,
//           priority: product.priority,
//           id: id,
//           // title: product.title,
//         );
//   }

//   @override
//   Future<Product> getProduct(int id) async {
//     for (int i = 0; i < _products.length; i++) {
//       if (_products[i].id == id) {
//         return _products[i];
//       }
//     }
//     throw Exception('Product not found');
//   }

//   @override
//   Future<List<Product>> getAllProducts() async{
//     return _products;
//   }
// }
