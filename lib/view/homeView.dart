import 'package:bakery_time/provider/homeProvider.dart';
import 'package:bakery_time/util/UtilWidgets.dart';
import 'package:bakery_time/widget/GoogleAdWidget.dart';
import 'package:bakery_time/widget/MainDrawerWidget.dart';
import 'package:bakery_time/util/UtilFunction.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';
import 'package:bakery_time/widget/MainAppBarWidget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      child: Scaffold(
        appBar: mainAppBarWidget(context),
        drawer: mainDrawerWidget(context),
        body: Consumer<HomeProvider>(
          builder: (context, provider, child) {
            return SafeArea(
              child: Container(
                color: backgroundColor,
                padding: const EdgeInsets.all(45),
                child: Column(
                  children: [
                    googleBannerAdWidget(),
                    emptyExpanded(),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.7 + 20,
                          decoration: previewContainerDecoration(),
                        ),
                        Positioned(
                          bottom: 3,
                          right: 3,
                          child: CircularPercentIndicator(
                            radius: 15.0,
                            lineWidth: 8.0,
                            animation: true,
                            percent: 0.7,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: sliderActiveColor,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    heightSizeBox(30),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 26.0,
                        trackShape: const RoundedRectSliderTrackShape(),
                        activeTrackColor: sliderActiveColor,
                        inactiveTrackColor: sliderDisableColor,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 14.0,
                          pressedElevation: 0.0,
                        ),
                        thumbColor: sliderDotColor,
                        overlayColor: sliderDotColor.withOpacity(0.5),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 20.0),
                        tickMarkShape: const RoundSliderTickMarkShape(),
                        inactiveTickMarkColor: sliderDotColor,
                      ),
                      child: Slider(
                        max: (1.5 * 60 * 60).toDouble(),
                        value: provider.timerSeconds,
                        divisions: 18,
                        //label: '',
                        onChanged: (value) {
                          provider.setTimerSeconds(value);
                        },
                      ),
                    ),
                    heightSizeBox(40),
                    Text(
                      secondFormatHHMMSS(provider.timerSeconds.floor()),
                      style: TextStyle(color: primaryColor, fontSize: 50),
                    ),
                    heightSizeBox(40),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Container(
                        decoration: startButtonDecoration(),
                        child: Center(
                            child: Text(
                          "베이킹 시작하기",
                          style: TextStyle(color: textWhiteColor),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

BoxDecoration previewContainerDecoration() {
  return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      color: itemBackgroundColor,
  );
}

BoxDecoration startButtonDecoration() {
  return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      color: buttonActiveColor,);
}
