import 'package:bakery_time/model/bakery_timer_model.dart';
import 'package:bakery_time/provider/timer_provider.dart';
import 'package:bakery_time/util/util_function.dart';
import 'package:bakery_time/util/util_widget.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:bakery_time/widget/google_ad_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerProvider>(
        create: (context) => TimerProvider(),
        child: Scaffold(
            backgroundColor: timerBackgroundColor,
            body: Consumer<TimerProvider>(builder: (context, provider, child) {
              BakeryTimer bakeryTimer = provider.bakeryTimer;
              return SafeArea(
                child: Column(
                  children: [
                    emptyExpanded(),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(
                              MediaQuery.of(context).size.width * 0.35)),
                          child: Image.asset(
                              'assets/images/loading_background.png',
                              width: MediaQuery.of(context).size.width * 0.70,
                              height: MediaQuery.of(context).size.width * 0.70,
                              fit: BoxFit.cover),
                        ),
                        CircularPercentIndicator(
                          radius: MediaQuery.of(context).size.width * 0.35,
                          lineWidth: 20.0,
                          animation: true,
                          animateFromLastPercent: true,
                          animationDuration: 300,
                          reverse: provider.isFinish,
                          percent:
                              provider.isFinish || bakeryTimer.targetTime <= 0
                                  ? 1.0
                                  : (bakeryTimer.targetTime -
                                          bakeryTimer.timerTime) /
                                      bakeryTimer.targetTime,
                          circularStrokeCap: CircularStrokeCap.butt,
                          progressColor: provider.isFinish
                              ? indicatorFinishColor
                              : indicatorActiveColor,
                          backgroundColor: indicatorDisableColor,
                        ),
                      ],
                    ),
                    heightSizeBox(50),
                    Center(
                      child: Text(
                        secondFormatHHMMSS(
                            (bakeryTimer.targetTime - bakeryTimer.timerTime)
                                .floor()),
                        style: TextStyle(color: textWhiteColor, fontSize: 50),
                      ),
                    ),
                    heightSizeBox(50),
                    GestureDetector(
                      onTap: () {
                        if (provider.isFinish) {
                          /* 상품지급 */
                          provider.giveReward();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home',
                            (route) => false,
                          );
                        } else {
                          googleRewardedAdWidget(() {
                            provider.giveUp();
                            provider.timer.cancel();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              '/home',
                              (route) => false,
                            );
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            color: buttonWhiteColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                        child: Center(
                            child: Text(
                          provider.isFinish ? "돌아갈래요!" : "중단할래요",
                          style: TextStyle(
                              color: textPrimaryColor, fontSize: 14.0),
                        )),
                      ),
                    ),
                    emptyExpanded(),
                    GestureDetector(
                        onTap: () => {},
                        child: Center(
                            child: Text(
                          "케이크를 완성하면?",
                          style: TextStyle(color: textBlackColor),
                        ))),
                    heightSizeBox(30)
                  ],
                ),
              );
            })));
  }
}
