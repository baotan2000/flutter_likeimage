import 'package:flutter/material.dart';
import 'package:flutter_likeimage_app/model/item_model.dart';
import 'package:flutter_likeimage_app/provider/item_provider.dart';
import 'package:provider/provider.dart';
import 'widget/body_swiper.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ItemProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<Item> Items = [
    Item(
        //fake name (ctrl+P: >faker name)
        //fake image xai khong duoc
        id: "1",
        name: "Central Assurance Specialist",
        image: "assets/images/img3.jpeg"),
    Item(
        id: "2",
        name: "Dynamic Accountability Liaison",
        image: "assets/images/img4.jpeg"),
    Item(
        id: "3",
        name: "Dynamic Markets Officer",
        image: "assets/images/img5.jpeg"),
    Item(
        id: "3",
        name: "Forward Usability Associate",
        image: "assets/images/img6.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.orangeAccent,
        title: const Center(child: Text("Favorite Image")),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 15, 20),
          child: Consumer<ItemProvider>(
            builder: (context, value, child) {
              return Badge(
                label: Text(
                  value.favorite.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.favorite),
              );
            },
          ),
        ),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      child: Text("Show all"),
                    ),
                    const PopupMenuItem(
                      child: Text("Favorite"),
                    ),
                  ]),
        ],
      ),
      body: SwipeBody(
        items: Items,
      ),
    );
  }
}
