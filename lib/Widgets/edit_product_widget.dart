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
              // ✅ صورة المنتج
              if (editProductCubit.imagePicker != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    editProductCubit.imagePicker!.path,
                    height: size.width * 0.5,
                    alignment: Alignment.center,
                  ),
                ),
              ] else if (editProductCubit.imagePicker != null) ...[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    editProductCubit.imagePicker!.path,
                    height: size.width * 0.5,
                    alignment: Alignment.center,
                  ),
                ),
              ] else ...[
                SizedBox(
                  width: size.width * 0.4 + 10,
                  height: size.width * 0.4,
                  child: DottedBorder(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
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
                            child: const Text(
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
              ],
              if (editProductCubit.imagePicker != null ||
                  editProductCubit.imagePicker != null) ...[
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
                      child: const Text(
                        "Pick another image",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        editProductCubit.removeProfilePic();
                      },
                      child: const Text(
                        "Remove image",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 25),
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
      ),
    );
  }
}
