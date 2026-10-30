// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:my_bloc_app/counter-app_cubit/counter_cubit.dart';
// import 'package:my_bloc_app/counter_with_bloc/counter_bloc.dart';
//
// class CounterScreen extends StatelessWidget {
//   const CounterScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Counter with bloc'),),
//       body: Padding(padding: EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           spacing: 12,
//           children: [
//             BlocBuilder<CounterBloc, int>(
//                 builder: (context, counter){
//                   return Text('$counter',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold
//                     ),
//                   );
//                 }),
//             Row(
//               spacing: 12,
//
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
