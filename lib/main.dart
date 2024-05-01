import 'package:bakery_time/static_page/agreeView.dart';
import 'package:bakery_time/static_page/enterView.dart';
import 'package:bakery_time/static_page/loadingView.dart';
import 'package:bakery_time/static_page/successSignupView.dart';
import 'package:bakery_time/view/homeView.dart';
import 'package:bakery_time/view/loginView.dart';
import 'package:bakery_time/view/signupView.dart';
import 'package:bakery_time/widget/UtilWidgets.dart';
import 'package:flutter/material.dart';
import '../view/albumView.dart';

void main() {
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
            scaffoldBackgroundColor: colorPrimaryWhite,
            appBarTheme: const AppBarTheme(color: colorPrimaryWhite)),
        debugShowCheckedModeBanner: false,
        title: "Flutter App",
        initialRoute: '/loading',
        routes: {
          '/loading': (context) => const LoadingView(),
          '/agree': (context) => const AgreeView(),
          '/enter': (context) => const EnterView(),
          '/index': (context) => const AlbumView(),
          '/login': (context) => const LoginView(),
          '/signup': (context) => const SignupView(),
          '/success': (context) => const SuccessSignupView(),
          '/home': (context) => const HomeView(),
        },
        home: const LoadingView());
  }
}

/*
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<AlbumViewModel>(
        create:(context) => AlbumViewModel(),
        child: const AlbumView()
      )
    );
  }
}
*/