import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchCubit>(context);
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: 10)),
              SliverToBoxAdapter(
                child: CustomTextFormField(
                  controller: searchCubit.searchController,
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchCubit.searchController.clear();
                    },
                    icon: Icon(Icons.clear, color: Colors.red),
                  ),
                  hintText: Strings.search,
                  onChanged: (value) {
                    log(value.toString());
                  },
                  onSaved: (value) {
                    log(searchCubit.searchController.text);
                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 15)),
              SliverFillRemaining(
                child: DynamicHeightGridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  builder: (context, index) => InkWell(
                    onTap: () async {
                      await GoRouter.of(
                        context,
                      ).push(AppRouter.kProductsDetails);
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
              ),
            ],
          ),
        );
      },
    );
  }
}