// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:to/bloc_observer.dart';
// // import 'package:to/product/data_provider/product_data.dart';
// // import 'package:to/product/product.dart';
// import 'package:http/http.dart' as http;
// import 'package:labpract/application/products/bloc/bloc.dart';
// import 'package:labpract/application/products/bloc/product_bloc.dart';
// import 'package:labpract/infra/products/data_provider/product_data.dart';
// import 'package:labpract/infra/products/repository/product_repository.dart';
// import 'package:labpract/presentation/products/screens/product_route.dart';
// // import 'package:to/product/repository/product_repository.dart';

// void main() {
//   // Bloc.observer = SimpleBlocObserver();

//   final ProductRepository productRepository = ProductRepository(
//     dataProvider: ProductDataProvider(
//       httpClient: http.Client(),
//     ),
//   );

//   runApp(
//     ProductApp(productRepository: productRepository),
//   );
// }

// class ProductApp extends StatelessWidget {
//   final ProductRepository productRepository;

//   ProductApp({required this.productRepository})
//       : assert(productRepository != null);

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//       value: this.productRepository,
//       child: BlocProvider(
//         create: (context) =>
//             ProductBloc(productRepository: this.productRepository)
//               ..add(ProductLoad()),
//         child: MaterialApp(
//           title: 'Product App',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//             visualDensity: VisualDensity.adaptivePlatformDensity,
//           ),
//           onGenerateRoute: ProductAppRoute.generateRoute,
//         ),
//       ),
//     );
//   }
// }
