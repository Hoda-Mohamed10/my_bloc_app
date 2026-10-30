import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_cubit.dart';
import 'home_details.dart';
import 'home_state.dart';
import 'package:lottie/lottie.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String>categories=['All','Politic','Sport','Education','AirPods'];
  int currIndex=0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu), color: Colors.black,),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search_sharp,color: Colors.black,)),
            IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none,color: Colors.black,))
          ],
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Center(
                child: Lottie.network(
                  'https://www.iconking.net/public-assets/lotties/306/1785166654.json',
                  width: 200,
                  height: 100,
                  repeat: true,
                )
              );
            }
            if (state is HomeFailure) {
              return Center(
                child: Text(state.msg),
              );
            }
            if (state is HomeSuccess) {
              return Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          bool isSelected= currIndex==index;
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                currIndex=index;
                              });
                              if(categories[index]=='All'){
                                context.read<HomeCubit>().getHomeData();
                              }else{
                                context.read<HomeCubit>().getSearchData(query: categories[index]);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: isSelected? Colors.amber:Colors.white,
                                border: Border.all(
                                  color: Colors.black
                                )
                              ),
                              child: Center(
                                child: Text(categories[index]),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index){
                          return SizedBox(width: 20,);
                        },
                      itemCount: categories.length,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('News For You'),
                      Text('Show More')
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.data.length,
                      separatorBuilder: (context, index) => Divider(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeDetails(model: state.data[index]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              spacing: 12,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    state.data[index].urlToImage ?? '',
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
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.data[index].author ?? 'Hoda Mohamed',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        state.data[index].description ?? 'Description',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          state.data[index].date ?? 'Date',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffD2B0B0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],),),
                        );},
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

