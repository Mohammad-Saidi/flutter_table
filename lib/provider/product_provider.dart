import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<DataColumn> editedColumn = [
    DataColumn(label: Text('Color')),
    DataColumn(label: Text('Size')),
    DataColumn(label: Text('Qty'))
  ];
  List<DataRow> editedRow = [
    DataRow(cells: <DataCell>[
      DataCell(
        DropdownButtonExample(),
      ),
      DataCell(
        DropdownButtonForSize(),
      ),
      DataCell(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(),
        ),
      )
    ]),
  ];

  void add() {
    editedRow.add(
      DataRow(cells: <DataCell>[
        DataCell(
          DropdownButtonExample(),
        ),
        DataCell(
          DropdownButtonForSize(),
        ),
        DataCell(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(),
          ),
        ),
      ]),
    );
    notifyListeners();
  }

  void remove() {
    if (editedRow.length > 1) {
      editedRow.removeLast();
    }
    notifyListeners();
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  T selectedValue<T>(List<T> values, T currentValue) {
    return currentValue ?? values.first;
  }

  final List<String> colorList = <String>[
    'Select',
    'Red',
    'Green',
    'Blue',
    'Yellow'
  ];

  String? selectedColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedColor = selectedValue(colorList, selectedColor);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedColor,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          selectedColor = value!;
        });
      },
      items: colorList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class DropdownButtonForSize extends StatefulWidget {
  const DropdownButtonForSize({super.key});

  @override
  State<DropdownButtonForSize> createState() => _DropdownButtonForSizeState();
}

class _DropdownButtonForSizeState extends State<DropdownButtonForSize> {
  T selectedValue<T>(List<T> values, T currentValue) {
    return currentValue ?? values.first;
  }

  final List<String> sizeList = <String>['Size', 'XXL', 'XL', 'M', 'L'];

  String? selectedSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selectedSize = selectedValue(sizeList, selectedSize);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedSize,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          selectedSize = value!;
        });
      },
      items: sizeList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
