// import 'package:flutter/material.dart';
//
// class BudgetPage extends StatelessWidget {
//   const BudgetPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 350,
//               child: Stack(
//                 children: [
//                   Column(
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         height: 240,
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.only(
//                             bottomLeft: Radius.circular(20),
//                             bottomRight: Radius.circular(20),
//                           ),
//                         ),
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: 35,
//                               left: 340,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(7),
//                                 child: Container(
//                                   height: 40,
//                                   width: 40,
//                                   color: Color.fromRGBO(250, 250, 250, 0.1),
//                                   child: Icon(
//                                     Icons.notification_add_outlined,
//                                     size: 30,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(top: 35, left: 10),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Good afternoon',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     'Enjelin Morgeana',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 20,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Positioned(
//                     top: 160,
//                     left: 37,
//                     child: Container(
//                       height: 170,
//                       width: 320,
//                       decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Color.fromRGBO(47, 125, 121, 0.3),
//                             offset: Offset(0, ),
//                           ),
//                         ],
//                         color: Color.fromARGB(255, 47, 125, 121),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ListView(
//                   children: [
//                     Card(
//                       elevation: 5.0,
//                       child: ListTile(
//                         leading: Icon(Icons.ac_unit),
//                         title: Text('Widget of the week'),
//                         subtitle: Text("#54...."),
//                         trailing: Icon(Icons.add),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
