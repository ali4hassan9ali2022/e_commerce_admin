import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce_admin/Core/utils/app_router.dart';
import 'package:ecommerce_admin/Cubit/Search_cubit/search_cubit.dart';
import 'package:ecommerce_admin/Cubit/Search_cubit/search_state.dart';
import 'package:ecommerce_admin/Widgets/app_bar_for_dashboard.dart';
import 'package:ecommerce_admin/Widgets/custom_product_widget.dart';
import 'package:ecommerce_admin/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    BlocProvider.of<SearchCubit>(context).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var searchCubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              children: [
                SizedBox(height: 20),
                AppBarForDashboard(size: size, title: "Search"),
                SizedBox(height: 15),
                CustomTextFormField(
                  controller: searchCubit.searchController,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchCubit.searchController.clear();
                    },
                    icon: Icon(Icons.clear, color: Colors.red),
                  ),
                  hintText: "Search",
                  onChanged: (value) {
                    log(value.toString());
                  },
                  onSaved: (value) {
                    log(searchCubit.searchController.text);
                  },
                ),

                SizedBox(height: 15),
                state is SuccessSearchState
                    ? DynamicHeightGridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        builder: (context, index) => InkWell(
                          onTap: () async {
                            final product = searchCubit.productsList[index];
                            await GoRouter.of(
                              context,
                            ).push(AppRouter.kEditProductView, extra: product);
                            searchCubit.fetchProducts();
                          },
                          child: CustomProductWidget(
                            productModel: state.products[index],
                          ),
                        ),
                        itemCount: state.products.length,
                        crossAxisCount: 2,
                      )
                    : state is LoadingSearchState
                    ? Center(child: CircularProgressIndicator())
                    : Center(child: Text("Not Products found")),
              ],
            ),
          );
        },
      ),
    );
  }
}
