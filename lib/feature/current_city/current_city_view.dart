import 'package:flutter/material.dart';
import 'package:weather_with_chad_api/core/constants/pad_value.dart';

class CurrentCityView extends StatelessWidget {
  const CurrentCityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 211, 102, 0),
            Colors.yellow,
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
        ),
        child: Padding(
          padding: PaddingValue.padAll,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: IconButton(
                            icon: const Icon(Icons.menu),
                            onPressed: () {},
                          )),
                      const Text("Mon, July 6"),
                      const Padding(
                          padding: PaddingValue.padAll, child: Text("C"))
                    ]),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(children: [
                    Text(
                      "Kyiv",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.circle, size: 8),
                        SizedBox(width: 5),
                        Icon(Icons.circle, size: 8),
                        SizedBox(width: 5),
                        Icon(Icons.circle, size: 8),
                        SizedBox(width: 5),
                        Icon(Icons.circle, size: 8),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "28°C",
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(color: Colors.white),
                    ),
                    Row(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.keyboard_arrow_up),
                            Text("31°")
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.keyboard_arrow_down),
                            Text("19°")
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Text("Sunny", style: Theme.of(context).textTheme.bodyLarge),
                    Text("Feels like 29°",
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
                  Stack(children: const [
                    Positioned(
                      child: Icon(Icons.wb_sunny_outlined, size: 120),
                      left: 40,
                      top: 40,
                    ),
                    CircleAvatar(
                        minRadius: 100, backgroundColor: Colors.white12),
                  ]),
                ],
              ),
              Column(
                children: [
                  const Divider(
                    thickness: 2,
                    height: 10,
                    color: Colors.white12,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Now",
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "28°",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Now",
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "28°",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Now",
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "25°",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Now",
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "30°",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text("Now",
                                style: Theme.of(context).textTheme.bodySmall),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "31°",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    height: 10,
                    color: Colors.white12,
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      other_day(context),
                      other_day(context),
                      other_day(context),
                      other_day(context),
                      other_day(context),
                      other_day(context),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding other_day(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text("Tuesday"),
          const Icon(Icons.sunny),
          Row(children: [
            Text(
              "31",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text("13", style: Theme.of(context).textTheme.bodySmall)
          ])
        ],
      ),
    );
  }
}
