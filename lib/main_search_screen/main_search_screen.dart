import 'package:flutter/material.dart';
import 'package:my_bloc_app/search_result_screen/search_result_screen.dart';
class MainSearchScreen extends StatefulWidget {
   const MainSearchScreen({super.key});

  @override
  State<MainSearchScreen> createState() => _MainSearchScreenState();
}

class _MainSearchScreenState extends State<MainSearchScreen> {
   TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 65.0,horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                onFieldSubmitted: (value){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context)=> SearchResultScreen(query: value,)));
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_sharp),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      controller.clear();
                    },
                      child: Icon(Icons.close)),
                  filled: true,
                  fillColor: Color(0XffF0EFF0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0XffF0EFF0))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff0088FF))
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(),

                ),
              ),
            ),
            TextButton(onPressed: (){
              controller.clear();
            }, child: Text('Cancel'))
          ],
        ),
      ),
    );
  }
}
