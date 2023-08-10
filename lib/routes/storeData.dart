

class StoreData{
 //Acts as adb to store the food name and price
StoreData._privateConstructor();
static final StoreData _instance = StoreData._privateConstructor();
  
  Map<String, String> _productNamePrice = Map<String, String>();
  
  factory StoreData()
  {

    return _instance;

  }

  int itemCount=0;
  void storeProductDetails(String name, String price){
var list = [];
    
//store it as akey value pair
   _productNamePrice[name] = price;

   

  // itemCount = itemCount+1;

  //  print('Item count add${itemCount}');
  
  print('product name');
  print(name);
  print('products price');
  print(price);
  print('product namePrice');
  print(_productNamePrice);

  print('product namePrice index 0');
  print(_productNamePrice.entries.elementAt(0)); //to Map data index

//  _productNamePrice.forEach((key, value) => list.add(_productNamePrice));



  }

  void removeProductDetails(String name){
    _productNamePrice.remove(name);
    print('products remove');
    print(_productNamePrice);

    itemCount = itemCount-1;
    
    print('Item count subtract${itemCount}');
   
  }

  Map<String, String> retrieveProductDetails(){

    return _productNamePrice;
    
    
  }

}