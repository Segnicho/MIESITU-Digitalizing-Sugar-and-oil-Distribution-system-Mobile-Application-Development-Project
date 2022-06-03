import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labpract/admin/index.dart';
import 'package:labpract/application/products/event/product_event.dart';
import 'package:labpract/application/products/state/product_state.dart';
import 'package:labpract/infra/products/repository/product_repository.dart';
// import 'package:labpract/product/bloc/bloc.dart';
// import 'package:labpract/product/product.dart';
// import 'package:labpract/product/repository/product_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository})
      : assert(productRepository != null),
        super(ProductLoading()

            // on<ProductLoad>
            ) {
    on<ProductLoad>((event, emit) async {
      emit(ProductLoading());
      try {
        // print('registeriiiiiiiiiiiiiiiiiing');
        final product = await productRepository.getProduct();

        // bool res = await authRepository.signUp(event.register);
        // if (product !=null) {
        print("created successfuly");
        emit(ProductLoadSuccess(product));
        // return;R
        // }

      } catch (_) {
        ProductOperationFailure();
      }
    });

    on<ProductCreate>((event, emit) async {
      await productRepository.createProduct(event.product);
      try {
        final product = await productRepository.createProduct(event.product);
        emit(ProductLoadSuccess());
      } catch (e) {
        emit(ProductOperationFailure());
      }
    });

    on<ProductUpdate>(((event, emit) async {
      emit(ProductLoading());
      try {
        await productRepository.updateProduct(event.product);
        final product = await productRepository.updateProduct(event.product);
        emit(ProductLoadSuccess());
      } catch (_) {
        emit(ProductOperationFailure());
      }
    }));

    // on<ProductUpdateSuccess>(((event, emit) async {
    //   emit(ProductLoading());
    //   try {
    //     await productRepository.updateProduct(event.product);
    //     final product = await productRepository.updateProduct(event.product);
    //     emit(ProductLoadSuccess());
    //   } catch (_) {
    //     emit(ProductOperationFailure());
    //   }
    // }));

    on<ProductDelete>(((event, emit) async {
      emit(ProductLoading());
      try {
        await productRepository.deleteProduct(event.product.id.toString());
        final product = await productRepository.getProduct();
        emit(ProductLoadSuccess());
      } catch (_) {
        emit(ProductOperationFailure());
      }
    }));
  }
}   








//   @override
//   Stream<ProductState> mapEventToState(ProductEvent event) async* {
//     if (event is ProductLoad) {
//       yield ProductLoading();
//       try {
//         final product = await productRepository.getProduct();
//         yield ProductLoadSuccess();
//       } catch (_) {
//         yield ProductOperationFailure();
//       }
//     }

//     if (event is ProductCreate) {
//       try {
//         await productRepository.createProduct(event.product);
//         final product = await productRepository.getProduct();
//         yield ProductLoadSuccess(product);
//       } catch (_) {
//         yield ProductOperationFailure();
//       }
//     }

//     if (event is ProductUpdate) {
//       try {
//         await productRepository.updateProduct(event.product);
//         final product = await productRepository.getProduct();
//         yield ProductLoadSuccess(product);
//       } catch (_) {
//         yield ProductOperationFailure();
//       }
//     }

//     if (event is ProductDelete) {
//       try {
//         await productRepository.deleteProduct(event.product.id);
//         final product = await productRepository.getProduct();
//         yield ProductLoadSuccess(product);
//       } catch (_) {
//         yield ProductOperationFailure();
//       }
//     }
//   }
// }