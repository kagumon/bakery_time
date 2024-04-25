import 'package:flutter/material.dart';

class LoadingView extends StatefulWidget {
  const LoadingView({super.key});

  @override
  State<LoadingView> createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromRGBO(134, 95, 87, 1),
        child: Stack(
          children: [
            GestureDetector(
              onTap: ()=>{Navigator.of(context).pushNamed('/enter')},
              child: const Text("로그인 안됨"),
            ),
            circleBox(deviceWidth * (-0.8), deviceWidth * (-0.9), deviceWidth * 1.5, const Color.fromRGBO(206, 183, 176, 1)),
            circleBox(deviceWidth * (0.3), deviceWidth * (-0.7), deviceWidth * 1.5, const Color.fromRGBO(228, 218, 215, 1)),
          ],
        ),
      )
    );
  }

  int getLocationLoginState() {
    /* 디바이스 내부 메모리에 로그인 된 정보가 있는지 확인한다. */
    return 1;
  }
}

Widget circleBox(double left, double bottom, double size, Color color) {
  return Positioned(
    left: left,
    bottom: bottom,
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(134, 95, 87, 1),
            blurRadius: 5.0,
            spreadRadius: 3.0
          )
        ]
      ),
    ),
  );
}