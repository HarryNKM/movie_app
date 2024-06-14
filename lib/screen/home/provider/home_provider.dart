import 'package:flutter/material.dart';
import 'package:movie_app/screen/home/model/home_model.dart';
import 'package:movie_app/utils/api_helper.dart';

class HomeProvider
    with ChangeNotifier {
  ApiHelper helper = ApiHelper();
  Future<HomeModal?>? modal;
  String search = "Movies";

  void searchData(String? s) {
    search = s!;
    getMoviedata();
    notifyListeners();
  }


  void getMoviedata() {
    modal = helper.getMovieApi(q: search);
    modal!.then((value) { if(value!=null)
      {
        notifyListeners();
      }
    });
  }
}