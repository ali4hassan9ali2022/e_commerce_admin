import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_admin/Core/utils/app_constants.dart';
import 'package:ecommerce_admin/Cubit/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_admin/Cubit/add_product_cubit/add_product_state.dart';
import 'package:ecommerce_admin/Widgets/custom_image_picker_dialog.dart';
import 'package:ecommerce_admin/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductWidget extends StatelessWidget {
  const AddProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var addProductCubit = BlocProvider.of<AddProductCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<AddProductCubit, AddProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: addProductCubit.formKey,
            child: Column(
              children: [
                if (addProductCubit.imagePicker == null) ...[
                  SizedBox(
                    width: size.width * 0.4 + 10,
                    height: size.width * 0.4,
                    child: DottedBorder(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_outlined,
                              size: 80,
                              color: Colors.blue,
                            ),
                            TextButton(
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomImagePickerDialog(
                                      addProduct: addProductCubit,
                                    );
                                  },
                                );
                              },
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
                ] else ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(
                      File(addProductCubit.imagePicker!.path),
                      height: size.width * 0.5,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
                if (addProductCubit.imagePicker != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            builder: (context) {
                              return CustomImagePickerDialog(
                                addProduct: addProductCubit,
                              );
                            },
                          );
                        },
                        child: Text(
                          "Pick another image",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          addProductCubit.removeProfilePic();
                        },
                        child: Text(
                          "Remove image",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 25),
                DropdownButton(
                  value: addProductCubit.productCategory,
                  hint: Text("Select a category"),
                  items: AppConstants.categoriesDropDownList,
                  onChanged: (value) {
                    addProductCubit.chooseCategory(value!);
                  },
                ),
                SizedBox(height: 25),
                CustomTextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please select a product title";
                    }
                    return null;
                  },
                  maxLength: 80,
                  controller: addProductCubit.productTitleController,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please select a price";
                          }
                          return null;
                        },
                        hintText: "Price",
                        controller: addProductCubit.productPriceController,
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please select a product Qty";
                          }
                          return null;
                        },
                        controller: addProductCubit.productQtyController,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please select a description";
                    }
                    return null;
                  },
                  controller: addProductCubit.productDescriptionController,
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
        },
      ),
    );
  }
}
