import 'package:ecommerce_admin/Cubit/add_product_cubit/add_product_cubit.dart';
import 'package:ecommerce_admin/Cubit/add_product_cubit/add_product_state.dart';
import 'package:ecommerce_admin/Widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSheetFotAddProduct extends StatelessWidget {
  const CustomBottomSheetFotAddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var addProductCubit = BlocProvider.of<AddProductCubit>(context);
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ElevatedButton.icon(
                  onPressed: () {
                    addProductCubit.productDescriptionController.clear();
                    addProductCubit.productPriceController.clear();
                    addProductCubit.productQtyController.clear();
                    addProductCubit.productTitleController.clear();
                    addProductCubit.removeProfilePic();
                    addProductCubit.removeCategory();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  label: Text(
                    "Clear",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  icon: Icon(Icons.clear, size: 22, color: Colors.white),
                ),
              ),
              Expanded(flex: 1, child: SizedBox(width: 5)),
              Expanded(
                flex: 5,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (addProductCubit.productCategory == null) {
                      CustomToastWidget.showWarningToast(
                        "Please select a product category",
                      );
                    }
                    if (addProductCubit.imagePicker == null) {
                      CustomToastWidget.showWarningToast(
                        "Please select a product image",
                      );
                    }
                    if (addProductCubit.formKey.currentState!.validate()) {
                      addProductCubit.addProduct();
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  label: state is AddProductLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          "Upload product",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                  icon: Icon(Icons.upload, size: 22, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
