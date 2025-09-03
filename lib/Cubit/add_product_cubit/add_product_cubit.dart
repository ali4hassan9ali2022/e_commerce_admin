import 'dart:developer';

import 'package:ecommerce_admin/Core/Database/Network/supabase_helper.dart';
import 'package:ecommerce_admin/Core/Helper/app_helper.dart';
import 'package:ecommerce_admin/Cubit/add_product_cubit/add_product_state.dart';
import 'package:ecommerce_admin/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQtyController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String? productCategory;
  void chooseCategory(String category) {
    productCategory = category;
    emit(ChooseCategoryState());
  }

  void removeCategory() {
    productCategory = null;
    emit(RemoveCategoryState());
  }

  XFile? imagePicker;
  uploadProfilePic(XFile image) {
    imagePicker = image;
    emit(UploadProfilePic());
  }

  removeProfilePic() {
    imagePicker = null;
    emit(RemoveProfilePic());
  }

  late SupabaseClient supabase = Supabase.instance.client;
  late ProductModel productModel;
  Future<void> addProduct() async {
    emit(AddProductLoading());
    try {
      final uuid = const Uuid().v4();
      String imageUrl = await AppHelper.uploadImageToStorage(
        uuid: uuid,
        profilePic: imagePicker,
        supabase: supabase,
        imageLinkOne: "products",
        imageLinkTwo: "products",
      );
      productModel = ProductModel(
        productTitle: productTitleController.text,
        productDescription: productDescriptionController.text,
        productPrice: productPriceController.text,
        productImage: imageUrl,
        productId: uuid,
        productQuantity: productQtyController.text,
        productCategory: productCategory!,
        createdAt: DateTime.now(),
      );
      AppHelper.productModel = productModel;
      bool isAdd = await SupabaseHelper.addData(
        tableName: "products",
        values: productModel.toJosn(),
      );

      log(isAdd.toString());
      emit(AddProductSuccess());
    } catch (e) {
      emit(AddProductFailure(errMessage: e.toString()));
    }
  }
}
