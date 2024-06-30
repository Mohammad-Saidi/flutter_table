


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_practice/provider/item_provider.dart';


class ItemTable extends StatelessWidget {
  ItemTable({super.key});

  final List<String> sizes = ['S', 'M', 'L', 'XL'];
  final List<String> colors = ['Red', 'Green', 'Blue', 'Black'];

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (context, itemProvider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: DataTable(
                        border: TableBorder.all(),
                        columns: [
                          DataColumn(label: Text('Size')),
                          DataColumn(label: Text('Color')),
                          DataColumn(label: Text('Quantity')),
                        ],
                        rows: itemProvider.items.map((item) {
                          int index = itemProvider.items.indexOf(item);
                          return DataRow(
                            cells: [
                              DataCell(
                                DropdownButton<String>(
                                  value: item.size.isNotEmpty ? item.size : null,
                                  hint: Text('Select',),
                                  items: sizes.map((size) {
                                    return DropdownMenuItem(
                                      value: size,
                                      child: Text(size),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      itemProvider.updateItem(
                                          index,
                                          Item(
                                              size: value,
                                              color: item.color,
                                              quantity: item.quantity));
                                    }
                                  },
                                ),
                              ),
                              DataCell(
                                DropdownButton<String>(

                                  value: item.color.isNotEmpty ? item.color : null,
                                  hint: Text('Select'),
                                  items: colors.map((color) {
                                    return DropdownMenuItem(
                                      value: color,
                                      child: Text(color),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value != null) {
                                      itemProvider.updateItem(
                                          index,
                                          Item(
                                              size: item.size,
                                              color: value,
                                              quantity: item.quantity));
                                    }
                                  },
                                ),
                              ),
                              DataCell(
                                TextField(
                                  controller: TextEditingController(text: item.quantity),
                                  onChanged: (value) {
                                    itemProvider.updateItem(
                                        index,
                                        Item(
                                            size: item.size,
                                            color: item.color,
                                            quantity: value));
                                  },

                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // final newItem = Item(size: '', color: '', quantity: '');
                  itemProvider.addItem(
                      Item(size: '', color: '', quantity: ''));
                  //itemProvider.addItem(newItem);
                },
                child: Text('Add Row'),
              ),
              ElevatedButton(
                onPressed: () {
                  final listOfSizes = itemProvider.items.map((e) => e.size).toList();
                  print(listOfSizes);
                  final listOfColors = itemProvider.items.map((e) => e.color).toList();
                  print(listOfColors);
                  bool isValid = itemProvider.items.every((item) => item.isValid());

                  if (isValid) {
                    // All rows are valid, perform necessary action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('All rows are valid')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: const Text('Please fill in all fields for each row')),
                    );
                  }





                },
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }
}