import 'package:ecommerce_admin/Models/product_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FancyShimmerImage(
            imageUrl: productModel.productImage,

            height: size.height * 0.22,
          ),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 4,
              child: Text(
                productModel.productTitle,
                style: TextStyle(fontSize: 18),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Flexible(
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: Icon(Icons.favorite, color: Colors.red),
            //   ),
            // ),
          ],
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "${productModel.productPrice}\$",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                ),

                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Flexible(
            //   child: IconButton.filled(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blueAccent,
            //       minimumSize: Size(20, 20),
            //     ),
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.add_shopping_cart_rounded,
            //       size: 18,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
