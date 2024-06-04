import 'package:flutter/material.dart';
import 'package:pharmgo/components/cart_item.dart';
import 'package:pharmgo/models/cart.dart';
import 'package:pharmgo/models/healthproduct.dart';
import 'package:pharmgo/widgets/app_button_widget.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            // heading
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),

            const SizedBox(
              height: 10,
            ),

            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: ((context, index) {
                  // get individual shoe
                  HealthProduct individualProduct = value.getUserCart()[index];
                  // return the cart item
                  return CartItem(
                    healthProduct: individualProduct,
                  );
                }),
              ),
            ),
            AppButtonWidget(
                title: "Check Out",
                titleColor: Colors.white,
                buttonBackgroundColor: Colors.cyan,
                buttonBorderColor: Colors.transparent,
                onPressed: () {
                  Navigator.pushNamed(context, "/deliveryDetails");
                }),
          ],
        ),
      ),
    );
  }
}
