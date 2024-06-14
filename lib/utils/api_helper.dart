import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/screen/home/model/home_model.dart';

class ApiHelper {
  Future<HomeModal?>? getMovieApi({String? q}) async {
    String link =
        "https://www.omdbapi.com/?s=$q&apikey=9662dec2";
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
       HomeModal? modal = HomeModal.mapToModal(json);
      return modal;
    }
    return null;
  }
}
