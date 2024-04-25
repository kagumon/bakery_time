import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/album.dart';
import '../viewModel/albumViewModel.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({super.key});

  @override
  State<AlbumView> createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late List<Album> albumList;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AlbumViewModel>(
      create: (context) => AlbumViewModel(),
      child: Scaffold(
        appBar: null,
        body: Consumer<AlbumViewModel>(
          builder: (context, provider, child) {
            albumList = provider.albumList;
            return ListView.builder(
              itemCount: albumList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  child: Text("${albumList[index].id}:${albumList[index].title}"),
                );
              }
            );
          },
        )
      )
    );
  }
}