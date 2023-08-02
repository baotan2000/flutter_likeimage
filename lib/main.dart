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

enum fillterOption {all, favorite}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    bool isFavorite = false;
@override
  void initState() {
    // TODO: implement initState
    Provider.of<ItemProvider>(context, listen: false).readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Center(child: Text("Favorite Image")),
        leading: Padding(
          padding: const EdgeInsets.all(15),
          child: Consumer<ItemProvider>(
            builder: (context, item, child) {
              return Badge(
                label: Text(
                  item.countItemFavorite.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                child: const Icon(Icons.favorite),
              );
            },
          ),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if(value == fillterOption.all){
                isFavorite = false;
              } else {
                isFavorite = true;
              }
              });
            },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: fillterOption.all,
                      child: Text("Show all"),
                    ),
                    const PopupMenuItem(
                      value: fillterOption.favorite,
                      child: Text("Favorite"),
                    ),
                  ]),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient:LinearGradient(
              colors: [Colors.red, Colors.yellow],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
          ),
        ),
      ),
      body: SwipeBody(
        isFavorite: isFavorite,
        // items: Items,
      ),
    );
  }
}
