
import 'dart:convert';

import 'package:flutter_http_p1/post_dto.dart';
import 'package:http/http.dart' as http;

class PostRepsitory{
  static PostRepsitory? _instance;
  PostRepsitory._();
  static PostRepsitory get instance => _instance ??= PostRepsitory._();

  Future<List<MovieDTOTable>?> getDTOList() async{
    String url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101";
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      return MovieDTOTable.fromJsonList(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}