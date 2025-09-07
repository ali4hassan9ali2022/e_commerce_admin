import 'dart:developer';

import 'package:ecommerce_admin/Core/Helper/app_helper.dart';
import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_state.dart';
import 'package:ecommerce_admin/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit() : super(EditProductInitialState());

  // Controllers
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQtyController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();
  String? productCategory;

  // Image
  XFile? imagePicker;
  String? productImageUrl;

  // Supabase
  late SupabaseClient supabase = Supabase.instance.client;
  late ProductModel productModel;

  // اختيار كاتيجوري
  void chooseCategory(String category) {
    productCategory = category;
    emit(ChooseCategoryState());
  }

  void removeCategory() {
    productCategory = null;
    emit(RemoveCategoryState());
  }

  // رفع صورة من الجهاز
  void uploadProfilePic(XFile image) {
    imagePicker = image;
    emit(UploadProfilePic());
  }
  void removeProfilePic() {
    imagePicker = null;
    productImageUrl = null;
    emit(RemoveProfilePic());
  }
  void fillFormWithProduct(ProductModel product) {
    productTitleController.text = product.productTitle;
    productPriceController.text = product.productPrice;
    productQtyController.text = product.productQuantity;
    productDescriptionController.text = product.productDescription;
    productCategory = product.productCategory;
    productImageUrl = product.productImage;
  }
  Future<void> editProduct(String productId, {bool removeImage = false}) async {
    emit(LoadingEditProductState());
    try {
      String imageUrl = productImageUrl ?? "";
      if (removeImage) {
        if (productImageUrl != null && productImageUrl!.isNotEmpty) {
          final oldPath = Uri.parse(
            productImageUrl!,
          ).pathSegments.skip(4).join('/');
          await supabase.storage.from("products").remove([oldPath]);
          log("🗑️ Deleted image: $oldPath");
        }
        imageUrl = ""; 
      }
      else if (imagePicker != null) {
        if (productImageUrl != null && productImageUrl!.isNotEmpty) {
          final oldPath = Uri.parse(
            productImageUrl!,
          ).pathSegments.skip(4).join('/');
          await supabase.storage.from("products").remove([oldPath]);
          log("🗑️ Deleted old image: $oldPath");
        }
        final uuid = const Uuid().v4();
        imageUrl = await AppHelper.uploadImageToStorage(
          uuid: uuid,
          profilePic: imagePicker!,
          supabase: supabase,
          imageLinkOne: "products",
          imageLinkTwo: "products",
        );
        log("⬆️ Uploaded new image: $imageUrl");
      }
      productModel = ProductModel(
        productTitle: productTitleController.text,
        productDescription: productDescriptionController.text,
        productPrice: productPriceController.text,
        productImage: imageUrl,
        productId: productId,
        productQuantity: productQtyController.text,
        productCategory: productCategory ?? "",
        createdAt: DateTime.now(),
      );

      log("📦 Updating product with ID: $productId");
      log("📦 Data: ${productModel.toJosn()}");
      final response = await supabase
          .from("products")
          .update(productModel.toJosn())
          .eq("productId", productId)
          .select();

      if (response.isEmpty) {
        emit(
          FailureEditProductState(
            errMessage: "⚠️ Failed to update product, check productId",
          ),
        );
      } else {
        emit(SuccessEditProductState());
      }
    } catch (e) {
      emit(FailureEditProductState(errMessage: e.toString()));
    }
  }
}
