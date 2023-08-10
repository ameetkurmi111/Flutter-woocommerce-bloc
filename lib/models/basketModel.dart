class BasketModel {
  int itemIndexCount;
  String productName;
  dynamic price;
  String choice;
  //dynamic deliveryCharge;
  dynamic productId;
  String taxClass;
  String description;
  String pageWhich;

  int get getItemIndexCount => itemIndexCount;
  String get getProductName => productName;
  dynamic get getPrice => price;
  String get getChoice => choice;
  dynamic get getProductId => productId;
  String get getTaxClass => taxClass;
  String get getDescription => description;
  String get getPageWhich => pageWhich;
  //dynamic get getdeliveryCharge => deliveryCharge;
  BasketModel(
      this.itemIndexCount,
      this.productName,
      this.price,
     // this.deliveryCharge,
      this.productId,
      this.taxClass,
      this.description,
      this.choice,
      this.pageWhich);
}
