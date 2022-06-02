// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:state/admin/index.dart';
// import 'package:state/admin/repository/product_repository.dart';

// void main() {
//   runApp(RecipeApp());
// }

// class RecipeApp extends StatelessWidget {
//   RecipeApp({Key? key}) : super(key: key);

//   final ProductBloc productBloc = ProductBloc(ProductRepository(ProductLocalProvider()));

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => productBloc..add(LoadProducts()),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home:const ProductListScreen(),
//       ),
//     );
//   }
// }