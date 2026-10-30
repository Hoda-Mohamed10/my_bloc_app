// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_bloc_app/counter-app_cubit/counter_cubit.dart';
// class CounterCubitScreen extends StatelessWidget {
//   const CounterCubitScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('counter with cubit'),
//       )
//       , body: Padding(
//       padding:  EdgeInsets.all(8.0),
//       child: Column(
//         spacing: 12,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           BlocBuilder <CounterCubit,int> (
//               builder: (context, counter) {
//                 return Text(
//                   '$counter',
//                   style: TextStyle(
//                       color: Colors.green,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold
//                   ),
//                 );
//               }
//           ),
//
//           Row(
//             spacing: 12,
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green
//                     ),
//                     onPressed: () {
//                       BlocProvider.of<CounterCubit>(context).increment();
//                     },
//                     child: Text('+',style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold),)),
//               ),
//
//               Expanded(
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red
//                     ),
//                     onPressed: () {
//                       BlocProvider.of<CounterCubit>(context).decrement();
//                     },
//                     child: Text('-',
//                         style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold))),
//               ),
//             ],
//           )
//         ],
//       ),
//     ),
//     );
//   }
// }

