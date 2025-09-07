abstract class EditProductState {}
class EditProductInitialState extends EditProductState {}
class LoadingEditProductState extends EditProductState{}
class SuccessEditProductState extends EditProductState{}
class FailureEditProductState extends EditProductState{
  final String errMessage;

  FailureEditProductState({required this.errMessage});
}