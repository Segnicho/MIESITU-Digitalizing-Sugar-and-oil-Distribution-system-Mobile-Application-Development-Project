// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:labpract/application/products/bloc/product_bloc.dart';
// import 'package:labpract/application/products/event/product_event.dart';
// import 'package:labpract/application/products/state/product_state.dart';
// import 'package:labpract/domain/poducts/models/product.dart';
// import 'package:labpract/presentation/products/screens/add_product.dart';
// import 'package:labpract/presentation/products/screens/product_add_update.dart';
// import 'package:labpract/presentation/products/screens/product_route.dart';
// import 'package:labpract/presentation/products/screens/screens.dart';
// // import 'package:to/product/models/product.dart';
// // import 'package:to/product/product.dart';

// class ProductDetail extends StatelessWidget {
//   ProductDetail({
//     Key? key,
//     required this.product,
//   }) : super(key: key) {
//     product_name.text = product.product_name;
//     product_price.text = product.product_price.toString();
//     // titleCtrl.text = product.title;
//   }

//   final Product product;
//   final product_name = TextEditingController();
//   final product_price = TextEditingController();
//   // final titleCtrl = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.product_name),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: product_name,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 controller: product_price,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               // SizedBox(height: 10),
//               // TextField(
//               //   controller: titleCtrl,
//               //   decoration: InputDecoration(
//               //     border: OutlineInputBorder(),
//               //   ),
//               // ),
//               SizedBox(height: 10),
//               BlocListener<ProductBloc, ProductState>(
//                 listener: (_, ProductState state) {
//                   if (state is ProductUpdateSuccess) {
//                     Navigator.pop(context, false);
//                   }
//                 },
//                 child: ElevatedButton(
//                   onPressed: () {
//                     final productBloc = BlocProvider.of<ProductBloc>(context);
//                     productBloc.add(
//                       ProductUpdate(
//                         Product(
//                             id: product.id,
//                             product_name: product_name.text,
//                             product_price: product_price.text),
//                         // title: titleCtrl.text,
//                       ),
//                       // ),
//                     );
//                   },
//                   child: const Text("Update"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





















// // class ProductDetail extends StatelessWidget {
// //   // static const routeName = 'productDetail';
// //   // final Product? product;
// //   // ProductDetail(this.product);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('${this.product!.product_name}'),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.edit),
// //             onPressed: () => Navigator.of(context).pushNamed(
// //               AddUpdateProduct.routeName,
// //               // onPressed: GoRouter.of(context).goNamed('/', extra: ProductArgument(product: product, edit: true),
// //               //   : ProductArgument(product: product, edit: true),
// //             ),
// //           ),
// //           SizedBox(
// //             width: 32,
// //           ),
// //           IconButton(
// //               icon: Icon(Icons.delete),
// //               onPressed: () {
// //                 context.read<ProductBloc>().add(ProductDelete(product!));
// //                 // Navigator.of(context).pushNamedAndRemoveUntil(
// //                 //     ProductList.routeName, (route) => false);
// //               }),
// //         ],
// //       ),
// //       body: Card(
// //         child: Column(
// //           children: [
// //             ListTile(
// //               title: Text('Product_name: ${this.product!.product_name}'),
// //               subtitle: Text('product_price: ${this.product!.product_price}'),
// //             ),
// //             Text(
// //               'Details',
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             SizedBox(
// //               height: 10,
// //             ),
// //             Text(this.product!.product_start_date.toString()),
// //           ],
// //         ),
// //       ),
//     // );
//   // }
// // }
