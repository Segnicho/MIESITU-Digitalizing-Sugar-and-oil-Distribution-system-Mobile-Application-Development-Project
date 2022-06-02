// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:state/admin/bloc/product_event.dart';
// import 'package:state/admin/bloc/product_state.dart';
// import 'package:state/admin/repository/product_repository.dart';

// // class ProductBloc extends Bloc<ProductEvent, ProductState> {
// //   final ProductRepository productRepository;

// //   ProductBloc(this.productRepository) : super(ProductsLoading()) {
// //     on<LoadProducts>(_onLoadProducts);
// //     on<UpdateProduct>(_onUpdateProduct);
// //   }
// //   void _onLoadProducts(LoadProducts event, Emitter emit) async {
// //     emit(ProductsLoading());
// //     await Future.delayed(const Duration(seconds: 3));
// //     final products = await productRepository.getAllProducts();
// //     if (products.hasError) {
// //       emit(ProductsLoadingFailed(products.error!));
// //     } else {
// //       emit(ProductsLoaded(products.val!));
// //     }
// //   }

//   void _onUpdateProduct(UpdateProduct event, Emitter emit) async {
//     await productRepository.editProduct(event.product.id, event.product);
//     emit(UpdateSuccessful());
//   }
// }
