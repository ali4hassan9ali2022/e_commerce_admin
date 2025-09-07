import 'dart:developer';

import 'package:ecommerce_admin/Core/Database/Network/supabase_helper.dart';
import 'package:ecommerce_admin/Cubit/Search_cubit/search_state.dart';
import 'package:ecommerce_admin/Models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController searchController = TextEditingController();
  List<ProductModel> productsList = [];
  Future<void> fetchProducts() async {
    emit(LoadingSearchState());
    try {
      final response = await SupabaseHelper.supabase.from("products").select();
      productsList.clear();
      productsList = (response as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      log(productsList.length.toString());
      emit(SuccessSearchState(products: productsList));
    } catch (e) {
      emit(FailureSearchState(errMessage: e.toString()));
    }
  }
}
