import 'dart:convert';


ProductModel productFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int id;
  String name;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  String stockStatus;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.stockStatus,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      shortDescription: json['shortDescription'],
      sku: json['sku'],
      price: json['price'],
      regularPrice: json['regularPrice'],
      salePrice: json['salePrice'],
      stockStatus: json['stockStatus']);

 

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "shortDescription": shortDescription,
        "sku": sku,
        "price": price,
        "regularPrice": regularPrice,
        "salePrice": salePrice,
      };

    
}