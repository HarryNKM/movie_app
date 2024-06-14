import 'package:flutter/material.dart';
import 'package:movie_app/screen/detail/view/detail_screen.dart';
import 'package:movie_app/screen/home/view/home_screen.dart';

Map<String,WidgetBuilder>app_routes={
  '/':(context)=>HomeScreen(),
  'detail':(context)=>DetailScreen(),
};