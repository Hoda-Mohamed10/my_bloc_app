// import 'package:flutter/material.dart';
//
// class ImplicitAnimations extends StatefulWidget {
//   const ImplicitAnimations({super.key});
//
//   @override
//   State<ImplicitAnimations> createState() =>
//       _ImplicitAnimationsState();
// }
//
// class _ImplicitAnimationsState extends State<ImplicitAnimations> {
//   double width = 150;
//   Color color = Colors.blue;
//
//   void changeBox() {
//     setState(() {
//       width = width == 150 ? 300 : 150;
//       color = color == Colors.blueAccent ? Colors.red : Colors.blue;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Animation Container'),
//       ),
//       body: Center(
//         child: Column(
//           spacing: 20,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             AnimatedContainer(
//               duration: Duration(seconds: 3),
//               width: width,
//               color: color,
//               height: 100,
//               curve: Curves.easeInOut,
//             ),
//             ElevatedButton(
//               onPressed: changeBox,
//               child: Text('Change Box'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }