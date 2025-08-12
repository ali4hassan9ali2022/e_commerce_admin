import 'package:ecommerce_admin/Cubit/add_product_cubit/add_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  TextEditingController productTitleController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQtyController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  String? productCategory;
  void chooseCategory(String category) {
    productCategory = category;
    emit(ChooseCategoryState());
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
}
