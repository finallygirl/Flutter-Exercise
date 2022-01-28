import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  
  final double rating; //当前评分
  final double maxRating; //最高评分
  final int count; //个数
  final double size; //大小
  final Color unselectedColor; //默认icon时，未选中图标的颜色
  final Color selectedColor; //默认icon时，选中图标的颜色
  final Widget unselectedImage; //未选中的图片
  final Widget selectedImage; //选中的图片

  StarRating({
    required String rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffc0c0c0),
    this.selectedColor = const Color(0xffffaa00),
    Widget? unselectedImage,
    Widget? selectedImage
  }): unselectedImage = unselectedImage ?? Icon(Icons.star,size: size, color: unselectedColor),
      selectedImage = selectedImage ?? Icon(Icons.star,size: size, color: selectedColor),
      rating = double.parse(rating);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getUnselectedStar(),
        getSelectedStar()
      ]
    );
  }
  // 获取未选中的Star
  Widget getUnselectedStar(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (int index) => widget.unselectedImage)
    );
  }
  // 获取选中的Star
  Widget getSelectedStar(){
    //该评分下星星的个数
    double num = widget.rating / widget.maxRating * widget.count ;
    // 1.计算完整的star
    int entireCount = num.floor();
    // 2.剩余的一个star显示比例
    double ratioLeft = num - entireCount;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(entireCount + 1, (int index){
        if (index < entireCount) return widget.selectedImage;
        return ClipRect(
          clipper: MyRectClipper(width:widget.size * ratioLeft),
          child:widget.selectedImage
        );
      })
    );
  }
}
class MyRectClipper extends CustomClipper<Rect> {
  double? width;
  MyRectClipper({this.width});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width ?? size.width, size.height);
  }
  @override
  bool shouldReclip(covariant MyRectClipper oldClipper) {
    return width != oldClipper.width;
  }
}