import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier{
  String PRICE="";
  //list of items on sale
  final List _medicine = [
    ["Vitamin E","50 ","assets/vitE1.png"],
    ["Vitamin C","50 ","assets/vitC1.png"],
    ["Vitrum","50","assets/vitrum1.png"],
    ["Centrum","50","assets/centrum1.png"],
    ["Vitamin B12","50","assets/vitB121.png"],
    ["Revital","50","assets/revital1.png"],
  ];
  final List  _women= [
    ["Ace","50 ","assets/ace.jpeg"],
    ["Fliban","50 ","assets/fliban.jpeg"],
    ["Freedom Pad","100","assets/pad.jpeg"],
    ["Women Plus","150","assets/plus.jpeg"],
    ["Biotin","50","assets/shampoo.jpeg"],
    ["Syrup","150","assets/champion.png"],
  ];
  final List _baby = [
    ["Aveeno","150 ","assets/aveeno.jpg"],
    ["Cough Syrup","250 ","assets/babySyrup.png"],
    ["Diaper","520","assets/diaper.jpeg"],
    ["Dropper","150","assets/dropper.jpg"],
    ["Feeder","150","assets/feeder.png"],
    ["Dymadon","75","assets/dymadon.png"],
  ];
  List _cartItems=[];

  get meds => _medicine;
  get wom => _women;
  get baby=> _baby;
  get cartItems => _cartItems;

  // add items to cart
  void addItemToCart(int index){
      _cartItems.add(_medicine[index]);
      notifyListeners();
  }
  void addItemToCart1(int index){
    _cartItems.add(_women[index]);
    notifyListeners();
  }
  void addItemToCart3(int index){
    _cartItems.add(_baby[index]);
    notifyListeners();
  }

  //remove items from the cart
  void removeFromCart(int index){
    _cartItems.removeAt(index);
    notifyListeners();
  }
  //calculate total price
  String calculateTotal(){
    double price=0;
    for(int i=0;i<_cartItems.length;i++){
      price+=double.parse(_cartItems[i][1]);
    }
    PRICE=price.toStringAsFixed(2);
    return price.toStringAsFixed(2);
  }
}