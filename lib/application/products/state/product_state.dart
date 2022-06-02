import 'package:equatable/equatable.dart';
import 'package:labpract/domain/poducts/models/product.dart';
// import 'package:labpract/product/models/product.dart';

class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductLoadSuccess extends ProductState {
  final List<Product> products;

  ProductLoadSuccess([this.products = const []]);

  @override
  List<Object> get props => [products];
}

class ProductOperationFailure extends ProductState {}

class ProductUpdateSuccess extends ProductState {}

class ProductAddSuccess extends ProductState {}
