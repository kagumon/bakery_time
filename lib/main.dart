import 'package:bakery_time/view/agree_page.dart';
import 'package:bakery_time/static_page/enter_page.dart';
import 'package:bakery_time/static_page/item_reward_page.dart';
import 'package:bakery_time/static_page/loading_page.dart';
import 'package:bakery_time/static_page/success_signup_page.dart';
import 'package:bakery_time/view/timer_view.dart';
import 'package:bakery_time/view/home_view.dart';
import 'package:bakery_time/view/login_view.dart';
import 'package:bakery_time/view/record_view.dart';
import 'package:bakery_time/view/shop_view.dart';
import 'package:bakery_time/view/signup_view.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  changeColorTheme("defualt");
  runApp(const Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            fontFamily: "bongodicMedium",
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: AppBarTheme(color: appbarBackgroundColor)),
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        initialRoute: '/loading',
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
          '/record': (context) => const RecordView(),
          '/timer': (context) => const TimerView(),
          '/reward': (context) => const ItemRewardPage(),
        },
        home: const LoadingPage());
  }
}
