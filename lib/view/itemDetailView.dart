import 'package:bakery_time/util/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemDetailView extends StatefulWidget {
  const ItemDetailView({super.key});

  @override
  State<ItemDetailView> createState() => _ItemDetailViewState();
}

class _ItemDetailViewState extends State<ItemDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Hero(tag: "item0001", child: Container(
            width: 100, height: 100,
                            decoration: BoxDecoration(
                              color: comm0000//shop0002,
                            ),
                            child: Text("크리스마스 케이크"),
                          ),)
        ],
      ),
    );
  }
}