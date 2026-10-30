// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:my_bloc_app/db_helper.dart';
//
// class CounterCubit extends Cubit<int>{
//   CounterCubit() : super(0){
//     getCounter();
//   }
//
//   final storage = FlutterSecureStorage();
//   Future<void> getCounter() async {
//     //final prefs = await SharedPreferences.getInstance();
//     //final counter = prefs.getInt('counter') ?? 0;
//       final value = await storage.read;
//     emit(counter);
//   }
//
//   Future<void> increment() async{
//     final newValue = state + 1;
//     emit(newValue);
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('counter', newValue);
//   }
//
//   Future<void> decrement() async{
//     final newValue = state - 1;
//     emit(newValue);
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('counter', newValue);
//   }
// }
