import 'package:douban_app/components/star_rating.dart';
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("小组")),
      body: Center(child: StarRating(rating: "45", count:6, maxRating: 60)));
  }
}