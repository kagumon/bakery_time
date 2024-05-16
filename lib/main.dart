import 'package:bakery_time/util/firebase_options.dart';
import 'package:bakery_time/util/pref_handler.dart';
import 'package:bakery_time/view/agree_view.dart';
import 'package:bakery_time/static_page/enter_page.dart';
import 'package:bakery_time/static_page/loading_page.dart';
import 'package:bakery_time/static_page/success_signup_page.dart';
import 'package:bakery_time/view/record_view.dart';
import 'package:bakery_time/view/timer_view.dart';
import 'package:bakery_time/view/home_view.dart';
import 'package:bakery_time/view/login_view.dart';
import 'package:bakery_time/view/shop_view.dart';
import 'package:bakery_time/view/signup_view.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferencesHandler pref = PreferencesHandler();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /* 앱 내 사용하는 전역 기능 초기화 */
  pref.initSharedPreferences();
  changeColorTheme("defualt");

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: "bongodicMedium",
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: AppBarTheme(color: appbarBackgroundColor)),
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        routes: {
          '/loading': (context) => const LoadingPage(),

          //회원가입 및 로그인
          '/agree': (context) => const AgreeView(),
          '/enter': (context) => const EnterPage(),
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignupView(),
          '/success': (context) => const SuccessSignupPage(),

          //메인 컨텐츠
          '/home': (context) => const HomeView(),
          '/shop': (context) => const ShopView(),
          '/timer': (context) => const TimerView(),
          '/record': (context) => const RecordView(),
        },
        home: const SignupView());
  }
}
