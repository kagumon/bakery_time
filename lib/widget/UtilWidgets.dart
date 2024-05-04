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

/* 색상 팔레트 */
const Color colorPrimary100 = Color(0xFFFAF5EB);
const Color colorPrimary200 = Color(0xFFF5EBD7);
const Color colorPrimary300 = Color(0xFFE1D1B9);
const Color colorPrimary400 = Color(0xFFC4B098);
const Color colorPrimary500 = Color(0xFF9D866E);
const Color colorPrimary600 = Color(0xFF876950);
const Color colorPrimary700 = Color(0xFF714F37);
const Color colorPrimary800 = Color(0xFF5B3723);
const Color colorPrimary900 = Color(0xFF4B2615);
const Color colorSuccess100 = Color(0xFFF1FCD3);
const Color colorSuccess200 = Color(0xFFE0F9A8);
const Color colorSuccess300 = Color(0xFFC5EE7A);
const Color colorSuccess400 = Color(0xFFA8DE57);
const Color colorSuccess500 = Color(0xFF80C926);
const Color colorSuccess600 = Color(0xFF65AC1B);
const Color colorSuccess700 = Color(0xFF4D9013);
const Color colorSuccess800 = Color(0xFF37740C);
const Color colorSuccess900 = Color(0xFF286007);
const Color colorInfo100 = Color(0xFFD1FDF0);
const Color colorInfo200 = Color(0xFFA4FBE9);
const Color colorInfo300 = Color(0xFF75F3E4);
const Color colorInfo400 = Color(0xFF52E7E2);
const Color colorInfo500 = Color(0xFF1ECFD8);
const Color colorInfo600 = Color(0xFF15A4B9);
const Color colorInfo700 = Color(0xFF0F7D9B);
const Color colorInfo800 = Color(0xFF095A7D);
const Color colorInfo900 = Color(0xFF054267);
const Color colorWarning100 = Color(0xFFFEF8D0);
const Color colorWarning200 = Color(0xFFFEF0A1);
const Color colorWarning300 = Color(0xFFFDE572);
const Color colorWarning400 = Color(0xFFFBDA4F);
const Color colorWarning500 = Color(0xFFF9C816);
const Color colorWarning600 = Color(0xFFD6A610);
const Color colorWarning700 = Color(0xFFB3870B);
const Color colorWarning800 = Color(0xFF906907);
const Color colorWarning900 = Color(0xFF775404);
const Color colorDanger100 = Color(0xFFFFECE0);
const Color colorDanger200 = Color(0xFFFFD5C2);
const Color colorDanger300 = Color(0xFFFFB9A4);
const Color colorDanger400 = Color(0xFFFF9E8D);
const Color colorDanger500 = Color(0xFFFF7268);
const Color colorDanger600 = Color(0xFFDB4C4E);
const Color colorDanger700 = Color(0xFFB73441);
const Color colorDanger800 = Color(0xFF932136);
const Color colorDanger900 = Color(0xFF7A1131);
const Color colorPrimaryGrey = Color(0xFFCFCAC7);
const Color colorPrimaryWhite = Color(0xFFFFFEFD);
const Color colorPrimaryBlack = Color(0xFF1F1E1D);