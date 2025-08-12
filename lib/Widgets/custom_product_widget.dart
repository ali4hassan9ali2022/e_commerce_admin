import 'package:ecommerce_admin/Core/utils/app_constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FancyShimmerImage(
            imageUrl: AppConstants.productImageUrl,

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
                "Title" * 10,
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
                "15\$",
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
