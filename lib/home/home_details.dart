import 'package:flutter/material.dart';
import 'package:my_bloc_app/models/article_model.dart';
import 'package:my_bloc_app/widgets/custom_app_bar_details.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key, required this.model});
  final ArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: CustomAppBarDetails(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.network(model.urlToImage ?? '',
                  errorBuilder: (context, error, stackTrace){
                    return Icon(
                          Icons.error,
                          size: 45,
                          color: Colors.red,
                        );
                  },
              )),
                Row(
                  spacing: 4,
                  children: [
                    Text(model.author ?? 'hoda',style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),),
                    Spacer(),
                    Icon(Icons.favorite_border_outlined),
                    Text('204',style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                Text(model.date ?? 'date',style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600
                ),),
                Text(model.description ?? 'description',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 10,),
                Text(model.content ?? 'content'),
          ],
        ),
      )
    );
  }
}
