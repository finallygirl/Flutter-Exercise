import 'package:douban_app/models/home_model.dart';
import 'package:douban_app/network/http_request.dart';
import 'package:douban_app/views/home/home_item.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: HomeBody()
    );
  }
}
class HomeBody extends StatefulWidget {
  const HomeBody({ Key? key }) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<MovieItem> movieItems = [];
  @override
  void initState() {
    HttpRequest.request("https://api.wmdb.tv/api/v1/top?type=Douban&skip=0&limit=25")
    .then((value) {
      final subjects = value.data;
      List<MovieItem> movies = [];
      for(var sub in subjects){
        movies.add(MovieItem.fromMap(sub));
      }
      setState(() => this.movieItems = movies);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movieItems.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieListItem(movieItems[index]);
        // return ListTile(
        //   leading: Image.network(movieItems[index].imageURL ?? "https://NoName.jpg"),
        //   title: Text(movieItems[index].name ?? "No Name")
        // );
      }
    );
  }
}