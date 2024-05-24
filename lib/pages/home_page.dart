
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../models/bitcoin_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(LoadBitcoinListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Information about Bitcoin at Bloc"),
      ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Stack(
              children: [
                ListView.builder(
                  itemCount: homeBloc.articles.length,
                  itemBuilder: (context, index) {
                    return itemOfArticle(homeBloc.articles[index]);
                  },
                )
              ],
            );
          },
        ));
  }

  Widget itemOfArticle(Article article) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 5),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CachedNetworkImage(
            height: 100,
            width: 100,
            fit: BoxFit.cover,
            imageUrl: article.urlToImage.toString(),
            placeholder: (context, url) => Container(
              height: 100,
              width: 100,
              color: Colors.grey,
            ),
            errorWidget: (context, url, error) => Container(
              height: 100,
              width: 100,
              color: Colors.grey,
              child: const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${article.title} ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),

                Text(
                  article.author.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 16,color:Colors.blue ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}