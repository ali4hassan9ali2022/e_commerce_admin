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

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var searchCubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
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
                DynamicHeightGridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  builder: (context, index) => InkWell(
                    onTap: () async {
                      await GoRouter.of(
                        context,
                      ).push(AppRouter.kEditProductView);
                      // await Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ProductsDetailsView(),
                      //   ),
                      // );
                    },
                    child: CustomProductWidget(),
                  ),
                  itemCount: 100,
                  crossAxisCount: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
