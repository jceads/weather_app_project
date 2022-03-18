import 'package:flutter/material.dart';
import 'package:weather_with_chad_api/core/constants/pad_value.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key? key,
    required this.onTapEvent,
    required this.textDays,
    this.typeOfDegree = "C",
  }) : super(key: key);
  final VoidCallback onTapEvent;
  final String textDays;
  final String typeOfDegree;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: onTapEvent, icon: const Icon(Icons.menu)),
          Text(textDays),
          Padding(
            padding: PaddingValue.padAll,
            child: Text(typeOfDegree),
          )
        ],
      ),
    );
  }
}


              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         IconButton(
              //             onPressed: () {},
              //             icon: IconButton(
              //               icon: const Icon(Icons.menu),
              //               onPressed: () {},
              //             )),
              //         const Text("Mon, July 6"),
              //         const Padding(
              //             padding: PaddingValue.padAll, child: Text("C"))
              //       ]),
              // ),