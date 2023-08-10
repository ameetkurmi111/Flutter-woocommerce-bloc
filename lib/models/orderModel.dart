//created by spandan
class OrderModel {
   int id;
   String orderKey;

  OrderModel({this.id, this.orderKey});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderKey: json['order_key'],
    );
  }
}

//created by Sabin
class Ordermodel {
  int product_id;
  String status;
  String date;
  int consumer_id;
  String total;                                                                                                                                                                                                 
  String customerNote;
  String paymentMethod;
  List<Items> line_items;
  List<Meta> meta_data;

  Ordermodel.fromJson(Map<String, dynamic> json) {
    product_id = json["id"];
    status = json["status"];
    date = json["date_created"];
    consumer_id = json["customer_id"];
    total = json["total"];
    customerNote = json["customer_note"];
    paymentMethod = json["payment_method"];

    if (json["line_items"] != null) {
      line_items = List<Items>();
      json["line_items"].forEach((v) {      
        line_items.add(Items.fromJson(v));     
      });
    }

    if(json["meta_data"] != null){
      meta_data = List<Meta>();
      json["meta_data"].forEach((a){
        meta_data.add(Meta.fromJson(a));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> orderdata = new Map<String, dynamic>();
  //   orderdata["id"] = this.product_id;
  //   orderdata["status"] = this.status;
  //   orderdata["date_created"] = this.date;
  //   orderdata["consumer_id"] = this.consumer_id;
  //   orderdata["total"] = this.total;
  //   orderdata["line_items"] = this.line_items;

  //   return orderdata;
  // }
}

class Items {
  int id;
  int product_id;
  String product_name;
  int quantity;
  String total;
  dynamic price;

  Items.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    product_id = json["product_id"];
    product_name = json["name"];
    quantity = json["quantity"];
    total = json["total"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> itemdata = Map<String, dynamic>();
    itemdata['id'] = this.id;
    itemdata['product_id'] = this.product_id;
    itemdata['name'] = this.product_name;
    itemdata['quantity'] = this.quantity;
    itemdata['total'] = this.total;
    itemdata['price'] = this.price;

    return itemdata;
  }
}

class Meta{

int id;
String key;
String value;

Meta.fromJson(Map<String, dynamic> json){

  id = json["id"];
  key = json["key"];
  value = json["value"];

}


Map<String, dynamic> toJson(){
  Map<String, dynamic>metadata = Map<String, dynamic>();
  metadata['id'] =  this.id;
  metadata['key'] = this.key;
  metadata['value'] = this.value;

}
}