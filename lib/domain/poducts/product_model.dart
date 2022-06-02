import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.id,
    required this.productName,
    required this.productPrice,
    // this.productStartDate,
    // this.productEndDate,
    this.productImg,
  });

  int? id;
  String productName;
  String productPrice;
  // DateTime? productStartDate;
  // DateTime? productEndDate;
  String? productImg;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        // productStartDate: DateTime.parse(json["product_start_date"]),
        // productEndDate: DateTime.parse(json["product_end_date"]),
        productImg: json["product_img"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "product_price": productPrice,
        // "product_start_date": productStartDate.toString(),
        // "product_end_date": productEndDate.toString(),
        "product_img": productImg ?? null,
      };
}
