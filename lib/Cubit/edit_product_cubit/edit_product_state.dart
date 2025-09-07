abstract class EditProductState {}
class EditProductInitialState extends EditProductState {}
class ChooseCategoryState extends EditProductState {}
class RemoveCategoryState extends EditProductState {}
class UploadProfilePic extends EditProductState {}
class RemoveProfilePic extends EditProductState {}
class LoadingEditProductState extends EditProductState{}
class SuccessEditProductState extends EditProductState{}
class FailureEditProductState extends EditProductState{
  final String errMessage;

  FailureEditProductState({required this.errMessage});
}