import 'package:bakery_time/widget/UtilWidgets.dart';
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
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: colorPrimary800,
      child: Stack(
        children: [
          Positioned(
            top: 100,
            child: GestureDetector(
              onTap: () => {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/enter", (route) => false)
              },
              child: const Text(
                "로그인 안됨",
                style: TextStyle(color: colorPrimaryWhite),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  int getLocationLoginState() {
    /* 디바이스 내부 메모리에 로그인 된 정보가 있는지 확인한다. */
    return 1;
  }
}
