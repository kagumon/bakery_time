import 'package:flutter/material.dart';

/* 빈 Flex박스 */
Expanded emptyExpanded() {
  return const Expanded(
    child: SizedBox.shrink(),
  );
}

/* 빈 세로 사이즈박스 */
SizedBox heightSizeBox(double h) {
  return SizedBox(
    height: h,
  );
}

/* 빈 세로 사이즈박스 */
SizedBox widthSizeBox(double w) {
  return SizedBox(
    width: w,
  );
}

/* 빈 원형 컨테이너, 회원가입시 주민번호 뒷자리 가리기용으로 만듦 */
Container circleContainer(
    {required double r,
    Color? c,
    double? left,
    double? right,
    double? top,
    double? bottom}) {
  return Container(
    margin: EdgeInsets.only(
      left: left ?? 0,
      right: right ?? 0,
      top: top ?? 0,
      bottom: bottom ?? 0,
    ),
    width: r,
    height: r,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(r)),
      color: c ?? const Color(0xFF000000),
    ),
  );
}
