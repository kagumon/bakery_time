/* 색상 팔레트 */
import 'package:flutter/material.dart';

void changeColorTheme(String type) {
  if(type == "brown") {
    //backgroundColor = const Color(0xFFFFFEFD);
    //appbarBackgroundColor = const Color(0xFF5B3723);
    //iconWhiteColor = const Color(0xFFFFFEFD);
    //sliderActiveColor = const Color(0xFF714F37);
    //sliderDisableColor = const Color(0xFFE1D1B9);
    //primaryColor = const Color(0xFF9D866E);
    //primaryColor = const Color(0xFF5B3723);
    //sliderDotColor = const Color(0xFFFFFEFD);
    //textWhiteColor = const Color(0xFFFFFEFD);
    //primaryColor = const Color(0xFF5B3723);
    //primaryColor = const Color(0xFF5B3723);
    //textPrimaryColor = const Color(0xFF4B2615);
    //textprimarySoftColor = const Color(0xFF876950);
    //primaryColor = const Color(0xFF4B2615);
    //logn0004 = const Color(0xFF4B2615);
    //buttonActiveColor = const Color(0xFF4B2615);
    //backgroundColor = const Color(0xFFFFFEFD);
    //appbarBackgroundColor = const Color(0xFF5B3723);
    //draw0003 = const Color(0xFFFFFEFD);
    //iconBlackColor = const Color(0xFF1F1E1D);
    //appbarBackgroundColor = const Color(0xFF5B3723);
    //shop0002 = const Color(0xFFFFFEFD);
    //tabActiveColor = const Color(0xFF876950);
    //tabDisableColor = const Color(0xFFE1D1B9);
    //primaryColor = const Color(0xFF4B2615);
    //primaryColor = const Color(0xFF4B2615);
    //primaryColor = const Color(0xFF4B2615);
    //buttonDisableColor = const Color(0xFFCFCAC7);
    //textPrimaryColor = const Color(0xFF4B2615);
    //iconPrimaryColor = const Color(0xFF4B2615);
    //iconGreyColor = const Color(0xFFCFCAC7);
    //calenderBackgroundColor = const Color(0xFFE1D1B9);
    //itemBackgroundColor = const Color(0xFFFFFEFD);
    //tabActiveColor = const Color(0xFF876950);
    //tabDisableColor = const Color(0xFFE1D1B9);
    //buttonActiveColor = const Color(0xFF4B2615);
    //textGreyColor = const Color(0xFF4B2615);
    //loadingBackgroundColor = const Color(0xFF5B3723);
    //textPrimaryColor = const Color(0xFF5B3723);
    //textprimarySoftColor = const Color(0xFF5B3723);
    //buttonActiveColor = const Color(0xFF5B3723);
    //buttonSubColor = const Color(0xFFE1D1B9);
    //iconPrimaryColor = const Color(0xFF4B2615);
    //textWhiteColor = const Color(0xFFFFFEFD);
    //comm0002 = const Color(0xFF1F1E1D);
    //iconGreyColor = const Color(0xFFCFCAC7);
    //primaryColor = const Color(0xFF4B2615);
  } else {
    primaryColor = const Color(0xFFF6BAB9);

    backgroundColor = const Color(0xFFFDFBFB);
    calenderBackgroundColor = const Color(0xFFFEEEED);
    loadingBackgroundColor = const Color(0xFFF6BAB9);
    timerBackgroundColor = const Color(0xFFF6BAB9);
    itemBackgroundColor = const Color(0xFFFCF4F4);
    appbarBackgroundColor = const Color(0xFFF6BAB9);

    sliderActiveColor = const Color(0xFFF6BAB9);
    sliderDisableColor = const Color(0xFFFEEEED);
    sliderDotColor = const Color(0xFFE4A8A7);
    
    indicatorActiveColor = Color(0xFFFCC9C8);
    indicatorDisableColor = Color(0xFFFFF6F6);

    tabActiveColor = const Color(0xFFF6BAB9);
    tabDisableColor = const Color(0xFFFDFBFB);

    buttonSubColor = const Color(0xFFFEEEED);
    buttonWhiteColor = const Color(0xFFFFFCFB);
    buttonActiveColor = const Color(0xFFF6BAB9);
    buttonDisableColor = Color(0xFFE4DEDD);

    iconBlackColor = const Color(0xFF302828);
    iconPrimaryColor = const Color(0xFFFB8887);
    iconGreyColor = Color(0xFFDCD9D9);
    iconWhiteColor = const Color(0xFFFFFCFC);

    textWhiteColor = const Color(0xFFFFFBFC);
    textPrimaryColor = const Color(0xFFF6BAB9);
    textprimarySoftColor = const Color(0xFFFFC0C8);
    textBlackColor = const Color(0xFF302828);
    textGreyColor = const Color(0xFF5D574E);
  }
}

late final Color primaryColor;
late final Color backgroundColor;
late final Color calenderBackgroundColor;
late final Color loadingBackgroundColor;
late final Color timerBackgroundColor;
late final Color itemBackgroundColor;
late final Color appbarBackgroundColor;
late final Color sliderActiveColor;
late final Color sliderDisableColor;
late final Color sliderDotColor;
late final Color indicatorActiveColor;
late final Color indicatorDisableColor;
late final Color tabActiveColor;
late final Color tabDisableColor;
late final Color buttonSubColor;
late final Color buttonWhiteColor;
late final Color buttonActiveColor;
late final Color buttonDisableColor;
late final Color iconBlackColor;
late final Color iconGreyColor;
late final Color iconPrimaryColor;
late final Color iconWhiteColor;
late final Color textWhiteColor;
late final Color textPrimaryColor;
late final Color textprimarySoftColor;
late final Color textBlackColor;
late final Color textGreyColor;




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
