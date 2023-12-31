class PaymentMethod {

  String id;
  String name;
  String description;
  String logo;
  String route;
  Function onTap;
  bool isRouteRedirect;

  PaymentMethod(
      this.id,
      this.name,
      this.description,
      this.logo,
      this.route,
      this.onTap,
      this.isRouteRedirect,
      );
}

  class PaymentMethodList {

  List<PaymentMethod> _paymentsList;
  List<PaymentMethod> _cashList;

  PaymentMethodList() {
    this._paymentsList = [
      PaymentMethod(
        "paypal",
        "Paypal",
        "Click to pay with Paypal Method",
        "assets/img/paypal",
        "/Paypal",
          () {},
        true,
      ),
    ];
    this._cashList = [
      PaymentMethod(
          "cod",
          "Cash on Delivery",
          "Click top pay cash on delivery",
          "assets/img/cash.png",
          "/OrderSuccess",
          () {},
      false),
    ];
  }

  List<PaymentMethod> get paymentsList => _paymentsList;
  List<PaymentMethod> get cashList => _cashList;
}