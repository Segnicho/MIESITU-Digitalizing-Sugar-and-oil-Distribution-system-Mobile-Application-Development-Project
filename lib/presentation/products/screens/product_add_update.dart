import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labpract/application/products/bloc/product_bloc.dart';
import 'package:labpract/application/products/event/product_event.dart';
import 'package:labpract/domain/poducts/models/product.dart';
import 'package:labpract/presentation/products/screens/product_list.dart';
import 'package:labpract/presentation/products/screens/product_route.dart';
// import 'package:to/product/models/product.dart';
// import 'package:to/product/product.dart';

// void main(List<String> args) {
//   runApp(AddUpdateProduct());
// }
























// class AdminProduct extends StatefulWidget {
//   AdminProduct({Key? key}) : super(key: key);
  

//   @override
//   State<AdminProduct> createState() => _AdminProductState();
// }

// class _AdminProductState extends State<AdminProduct> {

//   late final ProductArgument? args;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//             Text('${widget.args!.edit ? "Edit Product" : "Add New Product"}'),
//       ),
//     );
//   }
// }





// class AddUpdateProduct extends StatefulWidget {
//   static const routeName = 'productAddUpdate';
//   final ProductArgument? args;

//   AddUpdateProduct({this.args});
//   @override
//   _AddUpdateProductState createState() => _AddUpdateProductState();
// }

// class _AddUpdateProductState extends State<AddUpdateProduct> {
//   final _formKey = GlobalKey<FormState>();

//   final Map<String, dynamic> _product = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//             Text('${widget.args!.edit ? "Edit Product" : "Add New Product"}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                   initialValue: widget.args!.edit
//                       ? widget.args?.product.product_name
//                       : '',
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter product_name';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(labelText: 'product_name'),
//                   onSaved: (value) {
//                     setState(() {
//                       this._product["product_name"] = value;
//                     });
//                   }),
//               TextFormField(
//                   initialValue: widget.args!.edit
//                       ? widget.args!.product.product_price
//                       : '',
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter product_price';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(labelText: 'product_price'),
//                   onSaved: (value) {
//                     this._product["title"] = value;
//                   }),
//               TextFormField(
//                   initialValue: widget.args!.edit
//                       ? widget.args!.product.product_start_date.toString()
//                       : '',
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter product_start_date';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(labelText: 'product_start_date'),
//                   onSaved: (value) {
//                     setState(() {
//                       this._product["product_start_date"] = int.parse(value!);
//                     });
//                   }),
//               TextFormField(
//                   // initialValue: widget.args.edit? widget.args.product.product_end_date: '',
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter product_end_date';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(labelText: 'product_end_date'),
//                   onSaved: (value) {
//                     setState(() {
//                       this._product["description"] = value;
//                     });
//                   }),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     final form = _formKey.currentState;
//                     if (form!.validate()) {
//                       form.save();
//                       final ProductEvent event = widget.args!.edit
//                           ? ProductUpdate(
//                               Product(
//                                 id: widget.args!.product.id,
//                                 product_name: this._product["product_name"],
//                                 product_price: this._product["product_price"],
//                                 product_start_date:
//                                     this._product["product_start_date"],
//                                 product_end_date:
//                                     this._product["product_end_date"],
//                               ),
//                             )
//                           : ProductCreate(
//                               Product(
//                                 product_name: this._product["product_name"],
//                                 product_price: this._product["product_price"],
//                                 product_start_date:
//                                     this._product["product_start_date"],
//                                 product_end_date:
//                                     this._product["product_end_date"],
//                               ),
//                             );
//                       BlocProvider.of<ProductBloc>(context).add(event);
//                       // Navigator.of(context).pushNamedAndRemoveUntil(
//                       //     ProductList.routeName, (route) => false);
//                     }
//                   },
//                   label: Text('SAVE'),
//                   icon: Icon(Icons.save),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
