// import 'package:state/admin/data_provider/product_provider.dart';
// import 'package:state/admin/model/product.dart';
// import 'package:state/utils/either.dart';

// class ProductRepository {
//   ProductProvider productProvider;
//   ProductRepository(this.productProvider);

//   Future<List<Product>> getProductWithPriority(int priority) async {
//     final products = await productProvider.getAllProducts();
//     return products.where((product) => product.priority == priority).toList();
//   }

//   Future<Either<List<Product>>> getAllProducts() async {
//     try {
//       final products = await productProvider.getAllProducts();
//       return Either(val: products);
//     } catch (err) {
//       return Either(error: "Couldn't load products");
//     }
//   }

//   Future<Either<Product>> getProduct(int id) async {
//     try {
//       final product = await productProvider.getProduct(id);
//       return Either(val: product);
//     } catch (err) {
//       return Either(error: "Product not found");
//     }
//   }

//   addProduct(Product product) async {
//     final newProduct = Product(
//       id: product.id,
//       priority: product.priority,
//       description: product.description.trim(),
//       // title: product.title,
//     );

//     await productProvider.addProduct(newProduct);
//   }

//   Future<Either<String>> editProduct(int id, Product product) async {
//     try {
//       final newProduct = Product(
//           description: product.description.trim(),
//           priority: product.priority,
//           // title: product.title,
//           );
//       await productProvider.editProduct(id, newProduct);
//       return Either(val: "");
//     } catch (err) {
//       return Either(error: "Product not found");
//     }
//   }
// }
