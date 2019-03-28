import 'package:flutter/material.dart';
import 'package:flutter_app/components/home_banner.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        HomeBanner(),
        Text('home')
      ],
    );
  }
}