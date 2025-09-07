import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_admin/Core/utils/app_constants.dart';
import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_admin/Widgets/custom_image_picker_dialog_edit.dart';
import 'package:ecommerce_admin/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductWidget extends StatelessWidget {
  const EditProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var editProductCubit = BlocProvider.of<EditProductCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: editProductCubit.formKey,
          child: Column(
            children: [
              if (editProductCubit.imagePicker == null) ...[
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
                                  return CustomImagePickerDialogEdit(
                                    addProduct: editProductCubit,
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
                    File(editProductCubit.imagePicker!.path),
                    height: size.width * 0.5,
                    alignment: Alignment.center,
                  ),
                ),
              ],
              if (editProductCubit.imagePicker != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return CustomImagePickerDialogEdit(
                              addProduct: editProductCubit,
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
                        editProductCubit.removeProfilePic();
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
                value: editProductCubit.productCategory,
                hint: Text("Select a category"),
                items: AppConstants.categoriesDropDownList,
                onChanged: (value) {
                  editProductCubit.chooseCategory(value!);
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
                controller: editProductCubit.productTitleController,
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
                      controller: editProductCubit.productPriceController,
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
                      controller: editProductCubit.productQtyController,
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
                controller: editProductCubit.productDescriptionController,
                maxLength: 1000,
                maxLines: 5,
                hintText: "Product description",
                hintStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
