import 'package:ecommerce_admin/Core/Helper/app_helper.dart';
import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_cubit.dart';
import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomSheetForEditProduct extends StatelessWidget {
  const CustomBottomSheetForEditProduct({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    var editProductCubit = BlocProvider.of<EditProductCubit>(context);
    return BlocConsumer<EditProductCubit, EditProductState>(
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
                    AppHelper.clearAllFieldsEdit(
                      editProductCubit: editProductCubit,
                    );
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
                    if (editProductCubit.formKey.currentState!.validate()) {
                      editProductCubit.editProduct(productId);
                    }
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  label: state is LoadingEditProductState
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          "Edit product",
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
