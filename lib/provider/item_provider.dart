import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/item_model.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _items =[];
  int _countItemFavorite =0;

  List<Item> get items {
        //ba dấu chấm là copy lại cái _items 
        //-> return lại 1 cái array chứa _items bên trong
    return[..._items];
  }
  
  int get countItemFavorite {
    return _countItemFavorite;
  }

  List<Item> showItemFavorite(){
    List<Item> data = _items.where((element) => element.isFavorite).toList();
    return data.isEmpty ? [] : data;
    //kiem tra xem data co rỗng không? rỗng thì trả về mảng trống, k rỗng trả về data
  }

  void handleCountItemFav(){
    _countItemFavorite = _items.where((element) => element.isFavorite).length;
    notifyListeners();
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