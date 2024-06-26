import 'package:flutter/material.dart';
import 'package:widget_practice/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ProductProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DataTable(
              border: TableBorder.all(),
              columns: productProvider.editedColumn,
              rows: List<DataRow>.generate(
                productProvider.editedRow.length,
                (int index) => DataRow(
                  cells: List<DataCell>.generate(
                      productProvider.editedRow[index].cells.length,
                      (int cellno) =>
                          productProvider.editedRow[index].cells[cellno]),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        productProvider.add();
                      },
                      icon: Icon(Icons.add)),
                  SizedBox(width: 10.0,),
                  if (productProvider.editedRow.length > 1)
                  IconButton(
                    onPressed: () {
                      productProvider.remove();
                    },
                    icon: Icon(Icons.minimize_sharp),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
