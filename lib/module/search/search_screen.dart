import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_application/module/search/cubit/search_cubit.dart';
import 'package:shoping_application/module/search/widget/product_widget.dart';
import 'package:shoping_application/module/search/widget/search_widget.dart';
import 'package:shoping_application/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          SearchCubit cubit = SearchCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: appBar(context: context, title: 'Search in products'),
              body: Column(
                children: [
                  searchWidget(
                    controller: controller,
                    onChange: (value) {
                      cubit.search(text: value.toString());
                      cubit.changeSuffixIcon(text: value);
                    },
                    showSuffixIcon: cubit.showSuffix,
                  ),
                  Expanded(
                    child: ConditionalBuilder(
                      condition: cubit.searchModel == null,
                      builder: (context) => Center(
                        child: controller.text != ''
                            ? CircularProgressIndicator()
                            : null,
                      ),
                      fallback: (context) =>
                          ProductWidget(model: cubit.searchModel!),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
