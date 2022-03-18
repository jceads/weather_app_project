import 'package:flutter/material.dart';
import 'package:weather_with_chad_api/core/constants/pad_value.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key, required this.func, this.controller}) : super(key: key);
  final VoidCallback func;
  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 211, 102, 0),
          Colors.yellow,
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
      ),
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: PaddingValue.padAll,
            child: TextFormField(
                controller: controller,
                validator: (v) => v == "" ? "Please enter a city name" : null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.white)),
                )),
          ),
          ElevatedButton(onPressed: func, child: Text("Search"))
        ],
      )),
    );
  }
}
