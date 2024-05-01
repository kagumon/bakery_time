import 'package:bakery_time/widget/MainDrawerWidget.dart';
import 'package:bakery_time/widget/UtilWidgets.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: mainAppBarWidget(),
      drawer: mainDrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            emptyExpanded(),
            const Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("오늘의 목표 : 공부"),
                Expanded(child: SizedBox.shrink()),
                Text("포장하기"),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.width * 0.8,
              decoration: previewContainerDecoration(),
            ),
            const SizedBox(
              height: 20,
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 26.0,
                trackShape: const RoundedRectSliderTrackShape(),
                activeTrackColor: colorPrimary700,
                inactiveTrackColor: colorPrimary200,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 14.0,
                  pressedElevation: 0.0,
                ),
                thumbColor: colorPrimary500,
                overlayColor: colorPrimary800
                    .withOpacity(0.2),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 17.0),
                tickMarkShape: const RoundSliderTickMarkShape(),
                inactiveTickMarkColor: colorPrimaryWhite,
                //valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                //valueIndicatorColor: Colors.black,
                //valueIndicatorTextStyle: const TextStyle(
                //  color: colorPrimaryWhite,
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
            const Expanded(child: SizedBox.shrink()),
            Text(
              "${(_timeSliderValue / 60).floor().toString().padLeft(2, '0')}:${(_timeSliderValue % 60).floor().toString().padLeft(2, '0')}",
              style: const TextStyle(
                  color: colorPrimary900, fontSize: 50),
            ),
            const Expanded(child: SizedBox.shrink()),
            GestureDetector(
              onTap: () => {print("asd")},
              child: Container(
                height: 50,
                decoration: startButtonDecoration(),
                child: const Center(child: Text("베이킹 시작하기", style: TextStyle(color: colorPrimaryWhite),)),
              ),
            ),
            heightSizeBox(20)
          ],
        ),
      ),);
  }
}

BoxDecoration previewContainerDecoration() {
  return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: colorPrimary800,
            blurRadius: 6.0,
            spreadRadius: 2.0)
      ]);
}

BoxDecoration startButtonDecoration() {
  return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      color: colorPrimary700,
      boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 131, 112, 85),
            blurRadius: 10.0,
            spreadRadius: 0.0)
      ]);
}
