import 'package:flutter/material.dart';
import 'package:pharmgo/models/cart.dart';
import 'package:pharmgo/models/healthproduct.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  HealthProduct healthProduct;
  CartItem({super.key, required this.healthProduct});

  @override
  // ignore: library_private_types_in_public_api
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false)
        .removeItemFromCart(widget.healthProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.healthProduct.imagePath),
        title: Text(widget.healthProduct.name),
        subtitle: Text('₹ ${widget.healthProduct.price}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
