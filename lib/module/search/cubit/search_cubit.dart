import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoping_application/model/search_model.dart';
import 'package:shoping_application/shared/components/constants.dart';
import 'package:shoping_application/shared/network/end_points.dart';
import 'package:shoping_application/shared/network/remote/dio/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  bool showSuffix = false;

  void changeSuffixIcon({required String text}) {
    showSuffix = text.isNotEmpty;
    emit(ChangeSearchIconState());
  }

  int? productIndex;
  void assignIndex(int index) {
    productIndex = index;
    emit(ChangeProductIndexState());
  }

/* -------------------------------------------------------------------------- */
  SearchModel? searchModel;
  void search({required String text}) {
    DioHelper.postData(path: SEARCH, data: {
      'text': text,
      'token': token,
    }).then((value) {
      emit(SearchLoadingDataState());
      searchModel = SearchModel.fromJson(value.data);
      if (searchModel != null) {
        print('search test =>>> ${searchModel?.data?.data[0].name} ');
        emit(SearchSuccessDataState());
      }
    }).catchError((error) {
      emit(SearchErrorDatState());
    });
  }
}
