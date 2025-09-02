import 'package:ecommerce_admin/Models/product_model.dart';

abstract class AddProductState {}
class AddProductInitial extends AddProductState{}
class ChooseCategoryState extends AddProductState{}
class RemoveCategoryState extends AddProductState{}
class UploadProfilePic extends AddProductState{}
class RemoveProfilePic extends AddProductState{}

class AddProductLoading extends AddProductState{}
class AddProductSuccess extends AddProductState{
  final ProductModel productModel;

  AddProductSuccess({required this.productModel});
}
class AddProductFailure extends AddProductState{
  final String errMessage;

  AddProductFailure({required this.errMessage});
}