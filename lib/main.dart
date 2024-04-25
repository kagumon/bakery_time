import 'package:bakery_time/view/enterView.dart';
import 'package:bakery_time/view/loadingview.dart';
import 'package:bakery_time/view/loginView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      title: "Flutter App",
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => const LoadingView(),
        '/enter': (context) => const EnterView(),
        '/index': (context) => const AlbumView(),
        '/login': (context) => const LoginView(),
      },
      home: const LoadingView()
    );
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