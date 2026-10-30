import 'package:flutter/material.dart';
import 'circle_icon.dart';
class CustomAppBarDetails extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      leadingWidth: 50,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CircleIcon(icon: Icons.arrow_back_ios_outlined),
        ),
      ),
      title: Text('News Detail',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
        ),),
      centerTitle: true,
      actions: [Padding(
        padding: EdgeInsets.only(right: 8.0),
        child: CircleIcon(icon: Icons.bookmark_border),
      )],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
