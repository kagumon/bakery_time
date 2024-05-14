import 'package:bakery_time/model/bakery_timer_model.dart';
import 'package:bakery_time/model/item_model.dart';
import 'package:bakery_time/provider/home_provider.dart';
import 'package:bakery_time/util/util_widget.dart';
import 'package:bakery_time/widget/google_ad_widget.dart';
import 'package:bakery_time/widget/main_drawer_widget.dart';
import 'package:bakery_time/util/util_function.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bakery_time/widget/main_appbar_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

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
            BakeryTimer bakeryTimer = provider.bakeryTimer;
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
                          height: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                            color: itemBackgroundColor,
                          ),
                        ),
                        Positioned(
                            top: 80,
                            left: 80,
                            child: GestureDetector(
                              onTap: () {
                                if (provider.currentCake.currentStatus != 3) {
                                  showUnlockItemList(
                                      context, provider.queryItemList);
                                }
                              },
                              child: Image.asset(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7 -
                                          160,
                                  height:
                                      MediaQuery.of(context).size.width * 0.7 -
                                          160,
                                  "assets/images/${provider.selectedItem.type}/${provider.selectedItem.id}.png"),
                            )),
                        Visibility(
                          visible: provider.showExplain()["visiable"],
                          child: Positioned(
                              bottom: 10,
                              right: 60,
                              child: Container(
                                color: backgroundColor,
                                width: 200,
                                height: 40,
                                child: Center(
                                    child: Text(
                                        provider.showExplain()["explainText"])),
                              )),
                        ),
                        /* button Icons */
                        Visibility(
                          visible: provider.currentCake.currentStatus != 3,
                          child: Positioned(
                              top: MediaQuery.of(context).size.width * 0.35,
                              left: 0,
                              child: GestureDetector(
                                  onTap: () {
                                    provider.nextItemSelect(false);
                                  },
                                  child: Icon(
                                    Icons.arrow_left,
                                    color: iconGreyColor,
                                    size: 40,
                                  ))),
                        ),
                        Visibility(
                          visible: provider.currentCake.currentStatus != 3,
                          child: Positioned(
                              top:
                                  MediaQuery.of(context).size.width * 0.35 - 20,
                              right: 0,
                              child: GestureDetector(
                                  onTap: () {
                                    provider.nextItemSelect(true);
                                  },
                                  child: Icon(
                                    Icons.arrow_right,
                                    color: iconGreyColor,
                                    size: 40,
                                  ))),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 15,
                          child: GestureDetector(
                            onTap: () {
                              print(provider.currentCake.toJson());
                              print(provider.bakeryTimer.toJson());
                            },
                            child: CircularPercentIndicator(
                              radius: 15.0,
                              lineWidth: 8.0,
                              animation: true,
                              animateFromLastPercent: true,
                              percent: (bakeryTimer.targetTime +
                                              bakeryTimer.totalTime) /
                                          bakeryTimer.targetItemTime >=
                                      1.0
                                  ? 1.0
                                  : (bakeryTimer.targetTime +
                                          bakeryTimer.totalTime) /
                                      bakeryTimer.targetItemTime,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: (bakeryTimer.targetTime +
                                              bakeryTimer.totalTime) /
                                          bakeryTimer.targetItemTime >=
                                      1.0
                                  ? sliderDotColor
                                  : sliderActiveColor,
                              backgroundColor: Colors.white,
                            ),
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
                        min: (15 * 60).toDouble(),
                        value: bakeryTimer.targetTime,
                        divisions: 15,
                        onChanged: (value) {
                          provider.setTimerTime(value);
                        },
                      ),
                    ),
                    heightSizeBox(40),
                    Text(
                      secondFormatHHMMSS(bakeryTimer.targetTime.floor()),
                      style: TextStyle(color: primaryColor, fontSize: 50),
                    ),
                    heightSizeBox(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        emptyExpanded(),
                        Visibility(
                          visible: provider.currentCake.step! >= 4 &&
                              provider.currentCake.currentStatus != 3,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              height: 50,
                              width: provider.currentCake.step! < 6
                                  ? MediaQuery.of(context).size.width * 0.3 - 10
                                  : MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                color: buttonSubColor,
                              ),
                              child: Center(
                                  child: Text(
                                "포장하기",
                                style: TextStyle(color: textPrimaryColor),
                              )),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: provider.currentCake.step! < 6,
                          child: GestureDetector(
                            onTap: () {
                              provider.startTimer();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/timer", (route) => false);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 5, right: 5),
                              height: 50,
                              width: provider.currentCake.step! >= 4 &&
                                      provider.currentCake.currentStatus != 3
                                  ? MediaQuery.of(context).size.width * 0.4
                                  : MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                                color: buttonActiveColor,
                              ),
                              child: Center(
                                  child: Text(
                                "베이킹 시작하기",
                                style: TextStyle(color: textWhiteColor),
                              )),
                            ),
                          ),
                        ),
                        emptyExpanded(),
                      ],
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

Future<void> showUnlockItemList(
    BuildContext context, List<Item> itemList) async {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: primaryColor.withOpacity(0.8),
      backgroundColor: backgroundColor,
      builder: (context) {
        return Container(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: Center(
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: iconGreyColor,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: itemBackgroundColor,
                        child: Column(
                          children: [
                            Image.asset(
                                "assets/images/${itemList[index].type}/${itemList[index].id}.png")
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      });
}
