// import 'package:flutter/material.dart';
//
// enum ShirtSize { extraSmall, small, medium, large, extraLarge }
//
// const List<(ShirtSize, String)> shirtSizeOptions = <(ShirtSize, String)>[
//   (ShirtSize.extraSmall, 'XS'),
//   (ShirtSize.small, 'S'),
//   (ShirtSize.medium, 'M'),
//   (ShirtSize.large, 'L'),
//   (ShirtSize.extraLarge, 'XL'),
// ];
//
// class ToggleButtonsExample extends StatefulWidget {
//   const ToggleButtonsExample({super.key});
//
//   @override
//   State<ToggleButtonsExample> createState() => _ToggleButtonsExampleState();
// }
//
// class _ToggleButtonsExampleState extends State<ToggleButtonsExample> {
//   final List<bool> _toggleButtonsSelection =
//   ShirtSize.values.map((ShirtSize e) => e == ShirtSize.medium).toList();
//
//   Set<ShirtSize> _segmentedButtonSelection = <ShirtSize>{ShirtSize.medium};
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//       const Text('ToggleButtons'),
//       const SizedBox(
//         height: 10,
//       ),
//       ToggleButtons(
//         children: shirtSizeOptions
//             .map(((ShirtSize, String) shirt) => Text(shirt.$2))
//             .toList(),
//         // ToggleButtons uses a List<Bool> to
//         // track its selection state.
//         isSelected: _toggleButtonsSelection,
//         onPressed: (int index) {
//           setState(() {
//             _toggleButtonsSelection[index] =
//             !_toggleButtonsSelection[index];
//           });
//         },
//         constraints: const BoxConstraints(
//           minHeight: 32.0,
//           minWidth: 56.0,
//         ),
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       const Text('SegmentedButton'),
//       const SizedBox(
//         height: 10,
//       ),
//       SegmentedButton<ShirtSize>(
//
//         // ToggleButtons above allows
//         // multiple or no selection
//
//         multiSelectionEnabled: true,
//         emptySelectionAllowed: true,
//         showSelectedIcon: false,
//
//
//         segments: shirtSizeOptions.map(((ShirtSize, String) shirt) {
//           return ButtonSegment<ShirtSize>(value: shirt.$1, label: Text(shirt.$2));
//         }.toList(),
//           selected: _segmentedButtonSelection,
//         ),
//         ],
//       ),
//     );
//   }
// }
