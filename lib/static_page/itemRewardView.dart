import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemRewardView extends StatefulWidget {
  const ItemRewardView({super.key});

  @override
  State<ItemRewardView> createState() => _ItemRewardViewState();
}

class _ItemRewardViewState extends State<ItemRewardView> {
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
            Text("성공 ~ !"),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil("/home", (route) => false);
              },
              child: Text("돌아가기"),
            )
          ],
        ),
      ),
    );
  }
}