import 'package:flutter/material.dart';
import 'package:pharmgo/models/healthproduct.dart';

class Cart extends ChangeNotifier {
  //list of products for sale
  List<HealthProduct> shop = [
    HealthProduct(
        name: 'Gelusil MPS',
        price: '195.90',
        description: '',
        imagePath: 'images/gel.png'),
    HealthProduct(
        name: 'IR Thermometer',
        price: '1299',
        description: '',
        imagePath: 'images/termo.png'),
    HealthProduct(
        name: 'Pulse Oximeter',
        price: '2299',
        description: '',
        imagePath: 'images/oxy.png'),
    HealthProduct(
        name: 'First Aid Kit',
        price: '899',
        description: '',
        imagePath: 'images/firstaid.png'),
    HealthProduct(
        name: 'Adult Nebulizer Mask',
        price: '1000',
        description: '',
        imagePath: 'images/wes.png'),
    HealthProduct(
        name: 'Wheel Chair',
        price: '8699',
        description: '',
        imagePath: 'images/wheelchair.png'),
    HealthProduct(
        name: 'Ayurvedic medicine',
        price: '679',
        description: '',
        imagePath: 'images/a1.png'),
    HealthProduct(
        name: 'Septilin syrup',
        price: '250',
        description: '',
        imagePath: 'images/a2.png'),
    HealthProduct(
        name: 'Vitamin B',
        price: '1029',
        description: '',
        imagePath: 'images/a3.png'),
    HealthProduct(
        name: 'Vitamin B6 ',
        price: '474',
        description: '',
        imagePath: 'images/a4.png')
  ];
  // list of items in user cart
  List<HealthProduct> userCart = [];
  // get list of products for sale
  List<HealthProduct> getProductList() {
    return shop;
  }

  // get cart
  List<HealthProduct> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemCart(HealthProduct healthProduct) {
    userCart.add(healthProduct);
  }

  // remove item from cart
  void removeItemFromCart(HealthProduct healthProduct) {
    userCart.remove(healthProduct);
  }
}
