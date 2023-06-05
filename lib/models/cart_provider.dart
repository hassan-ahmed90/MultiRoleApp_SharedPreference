import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart_model.dart';
import 'db_helper.dart';


class CartProvider with ChangeNotifier{
  int _counter =0;
  int get counter => _counter;
  DBHelper db=DBHelper();
  double _totalPrice =0.0;
  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData()async{
    _cart=db.getCartList();
    return _cart;
  }
  void _setPrefItems()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }
  void _getPrefItems()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    _counter=prefs.getInt('cart_item') ?? 0;
    _totalPrice=prefs.getDouble('total_price') ?? 0.0;

    notifyListeners();
  }
  void addCounter(){
    _counter++;
    _setPrefItems();
    notifyListeners();
  }
  void removeCounter(){
    _counter--;
    _setPrefItems();
    notifyListeners();
  }
  int getCounter(){
    _getPrefItems();
    return _counter;
  }
  void addTotalPrice(double productPrice){
    _totalPrice=_totalPrice+productPrice;
    _setPrefItems();
    notifyListeners();
  }
  void removeTotalPrice(double productPrice){
    _totalPrice=_totalPrice-productPrice;
    _setPrefItems();
    notifyListeners();
  }
  double getTotalPrice(){
    _getPrefItems();
    return _totalPrice;
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shopping_cart/db_helper.dart';
// import 'cart_model.dart';
//
// class CarProvider with ChangeNotifier{
//
//   DBHelper db= DBHelper();
//   int _conuter =0;
//   int get _counter => _counter;
//
//   double _totalPrice =0.0;
//   double get totalPrice => _totalPrice;
//
//   late Future<List<Cart>> _cart;
//   Future<List<Cart>> get cart=> _cart;
//
// Future<List<Cart>> getData () async{
//   _cart=  db.getCartList();
//   return _cart;
//
// }
//
//
//
//
// void setPrefItem()async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setInt('cart_item', _counter);
//   prefs.setDouble('total_price', _totalPrice);
//   notifyListeners();
// }
//
// void getPreftem()async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   _conuter = prefs.getInt('cart_item')??0;
//   _totalPrice = prefs.getDouble('total_price')??0.0;
//   notifyListeners();
//
// }
//
//   void addTotalPrice(double ProductPrize){
//     _totalPrice=_totalPrice+ProductPrize;
//     setPrefItem();
//     notifyListeners();
//   }
//   void removeTotalPrize(double ProductPrize){
//     _totalPrice =_totalPrice-ProductPrize;
//     setPrefItem();
//     notifyListeners();
//   }
//   double getCTotalPrize(){
//     getPreftem();
//     return _totalPrice;
//
//   }
//
// void addCounter(){
//   _conuter++;
//   setPrefItem();
//   notifyListeners();
// }
//   void removeCounter(){
//     _conuter--;
//     setPrefItem();
//     notifyListeners();
//   }
//   int getCounter(){
//  getPreftem();
//   return _conuter;
//
//   }
//
//
// }