import 'package:ecommerce_admin/Models/product_model.dart';

abstract class SearchState {}
class SearchInitial extends SearchState {}
class LoadingSearchState extends SearchState {}
class SuccessSearchState extends SearchState {
   final List<ProductModel> products;

  SuccessSearchState({required this.products});
}
class FailureSearchState extends SearchState {
   final String errMessage;

  FailureSearchState({required this.errMessage});
}