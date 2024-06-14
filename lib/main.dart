import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes.dart';
import 'package:provider/provider.dart';

import 'screen/home/provider/home_provider.dart';

void main()
{
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: HomeProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    ),
  ));
}