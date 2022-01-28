import 'package:douban_app/components/dashed_line.dart';
import 'package:douban_app/components/star_rating.dart';
import 'package:douban_app/models/home_model.dart';
import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  
  final MovieItem item;

  MovieListItem(this.item);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width:10,color: Color(0xffe1e1e1)))
      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          getRankWidget(),
          SizedBox(height: 10),
          getMovieContent(),
          SizedBox(height: 10),
          getOriginalWidget()
      ])
    );
  }
  // 1.获取排名显示的Widget
  Widget getRankWidget(){
    return Container(
      padding: EdgeInsets.fromLTRB(9, 5, 9, 5),
      decoration: BoxDecoration(
        color: Colors.orange.shade300,
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text("No.${item.rank}", style: TextStyle(fontSize: 18, color: Colors.brown.shade600))
    );
  }
  // 2.获取中间内容显示
  Widget getMovieContent(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getMovieImage(),
        getDetailDescWidget(),
        getDashedWidget(),
        getWishWidget()
      ],
    );
  }
  // 2.1获取显示的图片
  Widget getMovieImage(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.network("${item.imageURL}",width: 100,errorBuilder: (a,b,c){
        return Container(width: 107, height: 146, color: Colors.grey,child: Center(child: Text("No Image", style: TextStyle(fontSize: 18,color: Colors.white))));
      })
    );
  }
  // 2.2获取描述的Widget
  Widget getDetailDescWidget(){
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getMovieNameWidget(),
            SizedBox(height: 5),
            getRatingWidget(),
            SizedBox(height: 5),
            getIntroduceWidget()
        ])
      )
    );
  }
  // 2.2.1获取电影名称的展示
  Widget getMovieNameWidget(){
    return Row(children: [
      Icon(Icons.play_circle_outline, color: Colors.orange.shade300,size: 26),
      SizedBox(width:5),
      Text("${item.name ?? "No Name"}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
    ]);
  }
  // 2.2.2 获取电影评分Widget
  Widget getRatingWidget(){
    return Row(children: [
      StarRating(rating: item.rating ?? "0", size: 22),
      SizedBox(width: 3),
      Text("${item.rating ?? "0"}")
    ]);
  }
  // 2.2.3 获取电影的简介
  Widget getIntroduceWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${item.year ?? ''} / ${item.country ?? ''} / ${item.genre ?? ''}"),
        Text("简介: ${item.description ?? ''}",maxLines: 3,overflow: TextOverflow.ellipsis)
    ]);
  }
  // 2.3获取分割线的Widget
  Widget getDashedWidget(){
    return Container(
      height: 100,
      width: 1,
      child: DashedLine(
        axis: Axis.vertical,
        dashedHeight: 5
      )
    );
  }
  // 2.4获取想看的Widget
  Widget getWishWidget(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Column(children: [
        Image.asset("assets/images/subject_rating_mark_wish.png",width: 32),
        SizedBox(height: 5),
        Text("想看", style: TextStyle(fontSize: 16, color: Colors.orange.shade300))
      ])
    );
  }
  // 3.获取原始电影名称的Widget
  Widget getOriginalWidget(){
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text("${item.originalName ?? ''}", style: TextStyle(fontSize: 18, color: Colors.black54))
    );
  }
}