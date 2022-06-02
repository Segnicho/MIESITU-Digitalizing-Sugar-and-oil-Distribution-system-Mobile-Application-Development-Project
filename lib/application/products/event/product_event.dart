import 'package:equatable/equatable.dart';
import 'package:labpract/domain/poducts/models/product.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class ProductLoad extends ProductEvent {
  const ProductLoad();

  @override
  List<Object> get props => [];
}

class ProductCreate extends ProductEvent {
  final Product product;

  const ProductCreate(this.product);

  @override
  List<Object> get props => [product];

  @override
  String toString() => 'product Created {product: $product}';
}

class ProductUpdate extends ProductEvent {
  final Product product;
  const ProductUpdate(this.product);
  @override
  List<Object> get props => [product];
  @override
  String toString() => 'product Updated {product: $product}';
}

class ProductDelete extends ProductEvent {
  final Product product;
  const ProductDelete(this.product);
  @override
  List<Object> get props => [product];
  @override
  toString() => 'product Deleted {product: $product}';
}
// class ProductsLoadingFailed extends ProductEvent{

// }
