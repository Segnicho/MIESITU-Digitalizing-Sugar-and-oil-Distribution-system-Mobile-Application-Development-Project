import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labpract/application/products/bloc/bloc.dart';
import 'package:labpract/application/products/bloc/product_bloc.dart';
import 'package:labpract/application/products/state/product_state.dart';
import 'package:labpract/domain/poducts/models/product.dart';
import 'package:labpract/domain/poducts/product_model.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final PriceTextFormFieldController = TextEditingController();

  final nameTextFormFieldController = TextEditingController();

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final productBloc = context.read<ProductBloc>();
    return Scaffold(
        appBar: AppBar(title: Text("Add Product here.")),
        body: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductLoading) {
              CircularProgressIndicator();
            } else if (state is ProductAddSuccess) {
              // GoRouter.of(context).push('userhome');
            } else if (state is ProductOperationFailure) {
              Text("Error adding the product");
              print("error");
            }
          },
          child: SafeArea(
              child: Form(
                  child: Column(
            children: [
              TextFormField(
                controller: PriceTextFormFieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              SizedBox(),
              TextFormField(
                controller: nameTextFormFieldController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  productBloc.add(ProductCreate(Product(
                      product_price: PriceTextFormFieldController.text,
                      product_name: nameTextFormFieldController.text)));
                },
                child: Text("ADD"),
              )
            ],
          ))),
        ));
  }
}




























// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:labpract/application/products/bloc/product_bloc.dart';
// import 'package:labpract/application/products/event/product_event.dart';
// import 'package:labpract/domain/poducts/models/product.dart';
// import 'package:labpract/presentation/products/screens/product_list.dart';
// import 'package:labpract/presentation/products/screens/product_route.dart';
// // import 'package:to/product/models/product.dart';
// // import 'package:to/product/product.dart';






// class AddUpdateProduct extends StatefulWidget {
// //   // static const routeName = 'productAddUpdate';
// //   final ProductArgument args;

//   AddUpdateProduct();
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
//         title: Text('${widget.args.edit ? "Edit Product" : "Add New Product"}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                   initialValue:
//                       widget.args.edit ? widget.args.product.product_name : '',
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
//                   initialValue:
//                       widget.args.edit ? widget.args.product.product_price : '',
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
//                   initialValue: widget.args.edit
//                       ? widget.args.product.product_start_date.toString()
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
//                       final ProductEvent event = widget.args.edit
//                           ? ProductUpdate(
//                               Product(
//                                 id: widget.args.product.id,
//                                 product_name: this._product["product_name"],
//                                 product_price: this._product["product_price"],
//                                 // product_start_date:
//                                 //     this._product["product_start_date"],
//                                 // product_end_date:
//                                 //     this._product["product_end_date"],
//                               ),


//                               // Product(
//                               //   id: widget.args.product.id,
//                               //   product_name: "this._product[" "]",
//                               //   product_price: "this._prodcduct[" "]",
//                               // product_start_date:
//                               //     this._product["product_start_date"],
//                               // product_end_date:
//                               //     this._product["product_end_date"],
//                               // ),
//                             )
//                           : ProductCreate(
//                               Product(
//                                 product_name: this._product["product_name"],
//                                 product_price: this._product["product_price"],
//                                 // product_start_date:
//                                 //     this._product["product_start_date"],
//                                 // product_end_date:
//                                 //     this._product["product_end_date"],
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
