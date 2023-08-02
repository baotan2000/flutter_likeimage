import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/item_model.dart';

class ItemProvider extends ChangeNotifier {
  // int _favorite = 0;

  // int get favorite => _favorite;

  // void updateFavorite() {
  //   _favorite++;
  //   notifyListeners();
  // }

  List<Item> _items =[];

  List<Item> get items {
        //ba dấu chấm là copy lại cái _items 
        //-> return lại 1 cái array chứa _items bên trong
    return[..._items];
  }

  void readJson() async {
    final String response = 
          await rootBundle.loadString('assets/json/items.json');
    final parsedList = await json.decode(response);
    List<Item> listData = List<Item>.from(
      parsedList.map((data) => Item.fromJson(jsonEncode(data))));
    _items = listData;
    notifyListeners();
  }

}