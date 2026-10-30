import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc_app/home/home_cubit.dart';
import 'package:my_bloc_app/home/home_details.dart';
import 'package:my_bloc_app/home/home_state.dart';
import 'package:lottie/lottie.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key, required this.query});
  final String query;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSearchData(query: query),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white,
          leading: BackButton(),
          title: Text('Search Result for $query',
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state){
          if (state is HomeLoading) {
            return Center(
              child: Lottie.network(
                'https://www.iconking.net/public-assets/lotties/306/1785166654.json',
                width: 150,
                height: 80,
                repeat: true,
              )
            );
          }
          if(state is HomeFailure){
            return Center(child: Text(state.msg,
              style: TextStyle(fontWeight: FontWeight.bold),),);
          }
          if(state is HomeSuccess){
            return ListView.separated(
              itemCount: state.data.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final item= state.data[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeDetails(model: item,)));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      spacing: 12,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.description ?? 'Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(item.author ?? 'Hoda Mohamed',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(item.date ?? 'Date',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffD2B0B0),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.network(item.urlToImage ?? '',
                            height: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.error,
                                size: 45,
                                color: Colors.red,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox();
        })
      ),
    );
  }
}
