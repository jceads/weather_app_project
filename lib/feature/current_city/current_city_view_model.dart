import 'package:flutter_bloc/flutter_bloc.dart';

class CityViewCubit extends Cubit<CityViewState> {
  CityViewCubit() : super(CityViewInitial());
}

abstract class CityViewState {}

class CityViewInitial extends CityViewState {}
