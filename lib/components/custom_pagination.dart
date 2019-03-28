import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class CustomPagination extends StatelessWidget{
  CustomPagination(this.config,{this.title,Key key}):super(key:key);
  final String title;
  final SwiperPluginConfig config;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: Colors.black12,
      height: 36,
      padding: EdgeInsets.only(top: 4,bottom: 4,left: 8,right: 8),
      child: Row(
        children: <Widget>[
          Text(title,
            style: TextStyle(color: Colors.white,),
          ),
        Expanded(
           flex: 1,
           child: Align(
             alignment: Alignment.centerRight,
             child: DotSwiperPaginationBuilder(
               size: 6,
               activeSize: 6,
               space: 2
             ).build(context, config),
           ),
        ),
        ],
      ),
    );
  }
}