import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../current_city/current_city_view.dart';
import 'page_manager_model.dart';
import '../../product/color_maker/color_generator.dart';
import '../../product/models/base_model.dart/base_model.dart';
import '../../product/network/network_manager.dart';
import '../../product/network/weather_info_service.dart';
import 'package:kartal/kartal.dart';

class PageManager extends StatelessWidget {
  PageManager({Key? key}) : super(key: key);
  int currentIndex = 0;
  List<BaseModel> list = [];
  var cityInputController = TextEditingController();
  final _controller = TextEditingController();
  bool isElevated = true;

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
          void _search(String city) {
            isElevated = !isElevated;
            context.read<PageManagerCubit>().getCityData(city);
          }

          if (state is EmptyListState) {
            return searchScaffold(context, _search);
          } else if (state is ShowCitiesState) {
            return cityDataScaffold(state, context);
          } else {
            return centerCircular();
          }
        },
      ),
    );
  }

  Scaffold searchScaffold(
      BuildContext context, void Function(String city) _search) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showSheet(context, _search);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(20)),
                padding: context.paddingMedium,
                child: Text(
                  "Add city +",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showSheet(BuildContext context, void _search(String city)) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        )),
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Divider(
                  thickness: 2,
                  height: MediaQuery.of(context).size.height * 0.03,
                  endIndent: MediaQuery.of(context).size.width * 0.1,
                  indent: MediaQuery.of(context).size.width * 0.1,
                ),
                TextFormField(
                  onFieldSubmitted: (value) {
                    _search(_controller.text);
                    Navigator.pop(context);
                  },
                  controller: _controller,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(),
                      labelText: "City",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: context.dynamicHeight(0.03),
                ),
                ElevatedButton(
                    onPressed: () {
                      _search(_controller.text);
                      Navigator.pop(context);
                    },
                    child: Text("Search")),
              ],
            ),
          );
        });
  }

  Scaffold centerCircular() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget cityDataScaffold(ShowCitiesState state, BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: ColorGen().generateColorList(
                          state.list[index].realTimeModel?.current?.tempC))),
            ),
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      context
                          .read<PageManagerCubit>()
                          .goToState(EmptyListState());
                    },
                    icon: const Icon(Icons.menu_rounded)),
                title: Text(DateFormat.yMMMMd("en-US").format(DateTime.now())),
              ),
              body: CurrentCityView(
                  iconBTNFunc: () => context
                      .read<PageManagerCubit>()
                      .goToState(WriteCityState()),
                  currentIndex: currentIndex,
                  model: state.list[index],
                  index: index),
            )
          ],
        );
      },
      itemCount: state.list.length,
    );
  }
}
