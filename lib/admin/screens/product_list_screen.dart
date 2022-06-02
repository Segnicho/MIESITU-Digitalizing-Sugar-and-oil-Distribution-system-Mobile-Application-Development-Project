// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:state/admin/bloc/product_bloc.dart';
// import 'package:state/admin/bloc/product_event.dart';
// import 'package:state/admin/bloc/product_state.dart';
// import 'package:state/admin/screens/product_viex_edit_screen.dart';

// class ProductListScreen extends StatelessWidget {
//   const ProductListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: BlocBuilder<ProductBloc, ProductState>(
//         buildWhen: (p, c) => c is! UpdateSuccessful,
//         builder: (_, ProductState state) {
//           if (state is ProductsLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }

//           if (state is ProductsLoadingFailed) {
//             return Center(
//               child: Text(state.msg),
//             );
//           }

//           if (state is ProductsLoaded) {
//             return ListView.builder(
//               itemCount: state.products.length,
//               itemBuilder: (_, int i) {
//                 return ListTile(
//                   onTap: () async {
//                     final result = await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => ProductViewEditScreen(
//                           product: state.products[i],
//                         ),
//                       ),
//                     );

//                     if (result == null) return;

//                     final productBloc = BlocProvider.of<ProductBloc>(context);
//                     productBloc.add(LoadProducts());
//                   },
//                   title: Text(state.products[i].description),
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
