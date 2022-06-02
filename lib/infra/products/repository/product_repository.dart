import 'package:labpract/domain/poducts/models/product.dart';
import 'package:labpract/infra/products/data_provider/product_data.dart';
import 'package:meta/meta.dart';
// import 'package:to/product/data_provider/product_data.dart';
// import 'package:to/product/models/product.dart';

class ProductRepository {
  final ProductDataProvider dataProvider;

  ProductRepository({required this.dataProvider})
      : assert(dataProvider != null);

  Future<Product> createProduct(Product product) async {
    return await dataProvider.createProduct(product);
  }

  Future<List> getProduct() async {
    return await dataProvider.getProduct();
  }

  Future<void> updateProduct(Product product) async {
    await dataProvider.updateProduct(product);
  }

  Future<void> deleteProduct(String id) async {
    await dataProvider.deleteProduct(id);
  }
}
