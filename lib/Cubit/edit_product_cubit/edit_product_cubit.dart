import 'package:ecommerce_admin/Cubit/edit_product_cubit/edit_product_state.dart';
import 'package:ecommerce_admin/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit() : super(EditProductInitialState());
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

  void fillFormWithProduct(ProductModel product) {
    productTitleController.text = product.productTitle;
    productPriceController.text = product.productPrice;
    productQtyController.text = product.productQuantity;
    productDescriptionController.text = product.productDescription;
    productCategory = product.productCategory;

    imagePicker = XFile(product.productImage); // لو الصورة جاية من URL
  }
}
