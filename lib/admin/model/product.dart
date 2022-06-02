import 'dart:math';

class Product {
  late int _id;
  // final String title;
  final String description;
  final int priority;

  int get id => _id;
  Product({required this.description,required this.priority, int? id}) {
    _id = id ?? Random.secure().nextInt(1000);
  }
}
