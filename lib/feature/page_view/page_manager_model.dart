import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_with_chad_api/product/models/base_model.dart/base_model.dart';
import 'package:weather_with_chad_api/product/network/weather_info_service.dart';

class PageManagerCubit extends Cubit<PageManagerState> {
  PageManagerCubit(this.baseModelList, this.service, this.cityInputCont)
      : super(PageManagerInitial()) {
    redirect();
  }
  List<BaseModel> baseModelList;
  TextEditingController cityInputCont;

  IGetWeatherInfoService service;
  BaseModel? oldModel;
  BaseModel? newModel;

  void redirect() {
    if (baseModelList.isEmpty) {
      emit(WriteCityState());
    } else {
      emit(ShowCitiesState(list: baseModelList));
    }
  }

  Future<void> getData(String city) async {
    // await Future.delayed(const Duration(seconds: 2));
    if (oldModel == null) {
      oldModel = await service.getAsBaseModel(city);
      if (oldModel != null) {
        baseModelList.add(oldModel!);
        emit(ShowCitiesState(list: baseModelList));
      }
    } else {
      if (oldModel == newModel) {
        newModel = await service.getAsBaseModel(city);
        if (newModel != null) {
          baseModelList.add(newModel!);
          emit(ShowCitiesState(list: baseModelList));
        } else {
          emit(ErrorState());
        }
      }
      return;
    }
    // if (model != null) {
    //   baseModelList.add(model);
    // } else {
    //   emit(ErrorState());
    // }
    // emit(ShowCitiesState());
  }
}

abstract class PageManagerState {}

class PageManagerInitial extends PageManagerState {}

class WriteCityState extends PageManagerState {}

class ShowCitiesState extends PageManagerState {
  List<BaseModel> list;
  ShowCitiesState({
    required this.list,
  });
}

class LoadingState extends PageManagerState {}

class ErrorState extends PageManagerState {}
