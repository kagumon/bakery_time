import 'dart:ffi';

import 'package:bakery_time/widget/MainDrawerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:bakery_time/widget/MainAppBarWidget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _timeSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    var previewConatinerSize = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: mainAppBarWidget(),
      drawer: mainDrawerWidget(),
      body: Row(
        children: [
          const Expanded(child: SizedBox.shrink()),
          SizedBox(
            width: previewConatinerSize,
            child: Column(
              children: [
                const Expanded(child: SizedBox.shrink()),
                const Row(
                  children : [
                    SizedBox(width: 30,),
                    Text("asd"),
                    Expanded(child: SizedBox.shrink()),
                    Text("qwe"),
                    SizedBox(width: 30,),
                  ],
                ),
                const SizedBox(height: 9,),
                Container(
                  width: previewConatinerSize * 0.9,
                  height: previewConatinerSize * 0.9,
                  decoration: previewContainerDecoration(),
                ),
                const SizedBox(height: 50,),
                SliderTheme(
                 data: SliderTheme.of(context).copyWith(
                   trackHeight: 26.0,
                   trackShape: const RoundedRectSliderTrackShape(),
                   activeTrackColor: const Color.fromARGB(255, 104, 91, 65),
                   inactiveTrackColor: const Color.fromARGB(255, 227, 216, 207),
                   thumbShape: const RoundSliderThumbShape(
                     enabledThumbRadius: 14.0,
                     pressedElevation: 0.0,
                   ),
                   thumbColor: const Color.fromARGB(255, 163, 142, 115),
                   overlayColor: const Color.fromARGB(255, 106, 90, 68).withOpacity(0.2),
                   overlayShape: const RoundSliderOverlayShape(overlayRadius: 17.0),
                   tickMarkShape: const RoundSliderTickMarkShape(),
                   inactiveTickMarkColor: Colors.white,
                   //valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                   //valueIndicatorColor: Colors.black,
                   //valueIndicatorTextStyle: const TextStyle(
                   //  color: Colors.white,
                   //  fontSize: 20.0,
                   //),
                 ),
                 child: Slider(
                   max: 180.0,
                   value: _timeSliderValue,
                   divisions: 18,
                   //label: '',
                   onChanged: (value) {
                     setState(() {
                       _timeSliderValue = value;
                     });
                   },
                 ),
                ),
                const SizedBox(height: 20,),
                Text(
                  "${(_timeSliderValue / 60).floor().toString().padLeft(2, '0')}:${(_timeSliderValue % 60).floor().toString().padLeft(2, '0')}",
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 50),
                ),
                const Expanded(child: SizedBox.shrink()),
                GestureDetector(
                  onTap: () => {print("asd")},
                  child: Container(
                    width: previewConatinerSize * 0.8,
                    height: 50,
                    decoration: startButtonDecoration(),
                    child: const Center(child: Text("베이킹 시작하기")),
                  ),
                ),
                const SizedBox(height: 60,),
              ],
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
        ],
      )
    );
  }
}

BoxDecoration previewContainerDecoration() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(130, 127, 123, 1),
        blurRadius: 3.0,
        spreadRadius: 2.0
      )
    ]
  );
}

BoxDecoration startButtonDecoration() {
  return const BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    color: Color.fromARGB(255, 198, 159, 104),
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 131, 112, 85),
        blurRadius: 10.0,
        spreadRadius: 0.0
      )
    ]
  );
}