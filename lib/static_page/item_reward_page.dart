import 'package:flutter/material.dart';

class ItemRewardPage extends StatelessWidget {
  const ItemRewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("성공 ~ !"),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
              },
              child: const Text("돌아가기"),
            )
          ],
        ),
      ),
    );
  }
}