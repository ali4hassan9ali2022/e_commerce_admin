

abstract class AddProductState {}
class AddProductInitial extends AddProductState{}
class ChooseCategoryState extends AddProductState{}
class RemoveCategoryState extends AddProductState{}
class UploadProfilePic extends AddProductState{}
class RemoveProfilePic extends AddProductState{}

class AddProductLoading extends AddProductState{}
class AddProductSuccess extends AddProductState{
 

  AddProductSuccess();
}
class AddProductFailure extends AddProductState{
  final String errMessage;

  AddProductFailure({required this.errMessage});
}