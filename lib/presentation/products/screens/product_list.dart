// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:labpract/application/products/bloc/product_bloc.dart';
// // import 'package:labpract/application/products/state/product_state.dart';
// // // import 'package:to/product/product.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:labpract/application/products/bloc/product_bloc.dart';
// import 'package:labpract/application/products/event/product_event.dart';
// import 'package:labpract/application/products/state/product_state.dart';
// import 'package:labpract/presentation/products/screens/product_detail.dart';

// class ProductListScreen extends StatelessWidget {
//   const ProductListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(actions: [
//         ElevatedButton(onPressed: () {}, child: Text("NewProduct"))
//       ]),
//       body: BlocBuilder<ProductBloc, ProductState>(
//         buildWhen: (p, c) => c is! ProductLoadSuccess,
//         builder: (_, ProductState state) {
//           if (state is ProductLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (state is ProductOperationFailure) {
//             return Center(
//               child: Text("Failed the operation"),
//             );
//           }

//           if (state is ProductLoadSuccess) {
//             return ListView.builder(
//               itemCount: state.products.length,
//               itemBuilder: (_, int i) {
//                 return ListTile(
//                   onTap: () async {
//                     final result = await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => ProductDetail(
//                           product: state.products[i],
//                         ),
//                       ),
//                     );

//                     if (result == null) return;

//                     final productBloc = BlocProvider.of<ProductBloc>(context);
//                     productBloc.add(const ProductLoad());
//                   },
//                   title: Text(state.products[i].product_name),
//                   subtitle: Text(state.products[i].product_price),
//                 );
//               },
//             );
//           }

//           return const Text("should never happen");
//         },
//       ),
//     );
//   }
// }
























// // class ProductList extends StatelessWidget {
// //   static const routeName = '/';
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('List of Products'),
// //       ),
// //       body: BlocBuilder<ProductBloc, ProductState>(
// //         builder: (_, state) {
// //           if (state is ProductOperationFailure) {
// //             return Text('Could not do product operation');
// //           }

// //           if (state is ProductLoadSuccess) {
// //             final products = state.products;
// //             return ListView.builder(
// //               itemCount: products.length,
// //               itemBuilder: (_, idx) => ListTile(
// //                 title: Text('${products[idx].product_name}'),
// //                 subtitle: Text('${products[idx].product_price}'),
// //                 onTap: () => Navigator.of(context).pushNamed(
// //                     ProductDetail.routeName,
// //                     arguments: products[idx]),
// //               ),
// //             );
// //           }

// //           return CircularProgressIndicator();
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () => Navigator.of(context).pushNamed(
// //           AddUpdateProduct.routeName,
// //           arguments: ProductArgument(edit: false),
// //         ),
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }
