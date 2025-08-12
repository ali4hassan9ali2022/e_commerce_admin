import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_admin/Core/utils/app_constants.dart';
import 'package:ecommerce_admin/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddProductWidget extends StatelessWidget {
  const AddProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            width: size.width * 0.4 + 10,
            height: size.width * 0.4,
            child: DottedBorder(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, size: 80, color: Colors.blue),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Pick product image",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          DropdownButton(
            hint: Text("Select a category"),
            items: AppConstants.categoriesDropDownList,
            onChanged: (value) {},
          ),
          SizedBox(height: 25),
          CustomTextFormField(
            maxLength: 80,
            hintText: "Product title",
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: "Price",

                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: CustomTextFormField(
                  hintText: "Qty",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          CustomTextFormField(
            maxLength: 1000,
            maxLines: 5,
            hintText: "Product description",
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          
        ],
      ),
    );
  }
}
