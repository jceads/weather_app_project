import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_with_chad_api/feature/current_city/current_city_view.dart';
import 'package:weather_with_chad_api/feature/page_view/page_manager_model.dart';
import 'package:weather_with_chad_api/feature/search_view/search_view.dart';
import 'package:weather_with_chad_api/product/models/base_model.dart/base_model.dart';
import 'package:weather_with_chad_api/product/network/network_manager.dart';
import 'package:weather_with_chad_api/product/network/weather_info_service.dart';

class PageManager extends StatelessWidget {
  PageManager({Key? key}) : super(key: key);
  int currentIndex = 0;
  List<BaseModel> list = [];
  var cityInputController = TextEditingController();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageManagerCubit(list,
          GetWeatherInfoService(NetworkManager.instance), cityInputController),
      child: BlocConsumer<PageManagerCubit, PageManagerState>(
        listener: (context, state) {
          if (state is LoadingState) {
            const AlertDialog(
              content: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is WriteCityState) {
            return SearchView(
              controller: _controller,
              func: () {
                context.read<PageManagerCubit>().getData(_controller.text);
              },
            );
          } else if (state is ShowCitiesState) {
            return buildDataScaffold(state, context);
          } else {
            return centerCircular();
          }
        },
      ),
    );
  }

  Scaffold centerCircular() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget buildDataScaffold(ShowCitiesState state, BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index) {
          return CurrentCityView(
              iconBTNFunc: () =>
                  context.read<PageManagerCubit>().goToState(WriteCityState()),
              currentIndex: currentIndex,
              model: state.list[index],
              index: index);
        },
        itemCount: state.list.length,
      ),
    );
  }
}
