import 'package:flutter/material.dart';
import 'package:weather_with_chad_api/core/constants/pad_value.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key, required this.func, required this.controller})
      : super(key: key);
  final VoidCallback func;

  final controller;
  final focusNode = FocusNode();

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
          body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 250, horizontal: 10),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(60),
                  child: Form(
                    autovalidateMode: focusNode.hasFocus
                        ? AutovalidateMode.disabled
                        : AutovalidateMode.always,
                    child: TextFormField(
                        focusNode: focusNode,
                        controller: controller,
                        validator: (v) =>
                            v == "" ? "Please enter a city name" : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white)),
                        )),
                  ),
                ),
                ElevatedButton(onPressed: func, child: Text("Search"))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
