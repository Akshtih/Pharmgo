import 'package:flutter/material.dart';
import 'package:pharmgo/models/healthproduct.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  HealthProduct healthProduct;
  void Function()? onTap;
  ProductTile({super.key, required this.healthProduct, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25),
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          // product picture
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child:
                Image.asset(healthProduct.imagePath, width: 500, height: 250),
          ),
          // description
          Text(
            healthProduct.name,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 15,
          ),

          // price + details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '₹ ${healthProduct.price}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),

              // button to add to cart

              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: const Icon(
                    Icons.add_shopping_cart_rounded,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
