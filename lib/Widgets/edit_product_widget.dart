import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_admin/Core/Helper/app_helper.dart';
import 'package:ecommerce_admin/Core/utils/app_constants.dart';
import 'package:ecommerce_admin/Core/utils/app_router.dart';
import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_state.dart';
import 'package:ecommerce_admin/Widgets/custom_image_picker_dialog_edit.dart';
import 'package:ecommerce_admin/Widgets/custom_text_form_field.dart';
import 'package:ecommerce_admin/Widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditProductWidget extends StatelessWidget {
  const EditProductWidget({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var editProductCubit = BlocProvider.of<EditProductCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocConsumer<EditProductCubit, EditProductState>(
        listener: (context, state) {
          if (state is SuccessEditProductState) {
            AppHelper.clearAllFieldsEdit(editProductCubit: editProductCubit);
            GoRouter.of(context).go(AppRouter.kSearchView);
            CustomToastWidget.showSuccessToast("Edit Product success");
          } else if (state is FailureEditProductState) {
            CustomToastWidget.showErrorToast(state.errMessage);
            log(state.errMessage);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: editProductCubit.formKey,
              child: Column(
                children: [
                  // ✅ عرض الصورة (جديدة أو قديمة)
                  if (editProductCubit.imagePicker != null) ...[
                    // صورة جديدة من الجهاز
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            File(editProductCubit.imagePicker!.path),
                            height: size.width * 0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              editProductCubit.removeProfilePic();
                            },
                          ),
                        ),
                      ],
                    ),
                  ] else if (editProductCubit.productImageUrl != null &&
                      editProductCubit.productImageUrl!.isNotEmpty) ...[
                    // صورة قديمة جاية من Supabase
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            editProductCubit.productImageUrl!,
                            height: size.width * 0.5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              editProductCubit.removeProfilePic();
                            },
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: 8,
                          child: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
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
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 25),

                  // ✅ Dropdown للتصنيف
                  DropdownButton(
                    value: editProductCubit.productCategory,
                    hint: const Text("Select a category"),
                    items: AppConstants.categoriesDropDownList,
                    onChanged: (value) {
                      editProductCubit.chooseCategory(value!);
                    },
                  ),

                  const SizedBox(height: 25),

                  // ✅ العنوان
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a product title";
                      }
                      return null;
                    },
                    maxLength: 80,
                    controller: editProductCubit.productTitleController,
                    hintText: "Product title",
                    hintStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // ✅ السعر والكمية
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a price";
                            }
                            return null;
                          },
                          hintText: "Price",
                          controller: editProductCubit.productPriceController,
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter product quantity";
                            }
                            return null;
                          },
                          controller: editProductCubit.productQtyController,
                          hintText: "Qty",
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // ✅ الوصف
                  CustomTextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a description";
                      }
                      return null;
                    },
                    controller: editProductCubit.productDescriptionController,
                    maxLength: 1000,
                    maxLines: 5,
                    hintText: "Product description",
                    hintStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
