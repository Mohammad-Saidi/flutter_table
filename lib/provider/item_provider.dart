import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Item {
  String size;
  String color;
  String quantity;


  Item({required this.size, required this.color, required this.quantity});


  bool isValid() {
    return size.isNotEmpty && color.isNotEmpty && quantity.isNotEmpty;
  }



}



class ItemProvider extends ChangeNotifier {
  List<Item> _items = [Item(size: '', color: '', quantity: '')];
  List<Item> get items => _items;


  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void updateItem(int index, Item item) {
    _items[index] = item;
    notifyListeners();
  }




}