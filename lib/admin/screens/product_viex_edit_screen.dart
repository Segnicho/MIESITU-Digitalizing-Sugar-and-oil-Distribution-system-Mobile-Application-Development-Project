// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:state/admin/bloc/product_bloc.dart';
// import 'package:state/admin/bloc/product_event.dart';
// import 'package:state/admin/bloc/product_state.dart';
// import 'package:state/admin/model/product.dart';

// class ProductViewEditScreen extends StatelessWidget {
//   ProductViewEditScreen({
//     Key? key,
//     required this.product,
//   }) : super(key: key) {
//     descCtrl.text = product.description;
//     priorityCtrl.text = product.priority.toString();
//     // titleCtrl.text = product.title;
//   }

//   final Product product;
//   final descCtrl = TextEditingController();
//   final priorityCtrl = TextEditingController();
//   // final titleCtrl = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(product.description),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: descCtrl,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextField(
//                 controller: priorityCtrl,
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
//                   if (state is UpdateSuccessful) {
//                     Navigator.pop(context, false);
//                   }
//                 },
//                 child: ElevatedButton(
//                   onPressed: () {
//                     final productBloc = BlocProvider.of<ProductBloc>(context);
//                     productBloc.add(
//                       UpdateProduct(
//                         Product(
//                           id: product.id,
//                           description: descCtrl.text,
//                           priority: int.parse(priorityCtrl.text),
//                           // title: titleCtrl.text,
//                         ),
//                       ),
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
