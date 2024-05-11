import 'package:bakery_time/static_page/agreeView.dart';
import 'package:bakery_time/static_page/enterView.dart';
import 'package:bakery_time/static_page/loadingView.dart';
import 'package:bakery_time/static_page/successSignupView.dart';
import 'package:bakery_time/static_page/test.dart';
import 'package:bakery_time/static_page/timerView.dart';
import 'package:bakery_time/view/homeView.dart';
import 'package:bakery_time/view/loginView.dart';
import 'package:bakery_time/view/recordView.dart';
import 'package:bakery_time/view/shopView.dart';
import 'package:bakery_time/view/signupView.dart';
import 'package:bakery_time/util/theme.dart';
import 'package:flutter/material.dart';
import '../view/albumView.dart';

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
            scaffoldBackgroundColor: main0001,
            appBarTheme: AppBarTheme(color: main0002)),
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        initialRoute: '/loading',
        routes: {
          '/loading': (context) => LoadingView(),

          //회원가입 및 로그인
          '/agree': (context) => const AgreeView(),
          '/enter': (context) => const EnterView(),
          '/index': (context) => const AlbumView(),
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignupView(),
          '/success': (context) => const SuccessSignupView(),

          //메인 컨텐츠
          '/home': (context) => const HomeView(),
          '/shop': (context) => const ShopView(),
          '/record': (context) => const RecordView(),
          '/timer': (context) => const TimerView(),

          '/test': (context) => const TestView(),
        },
        home: LoadingView());
  }
}
