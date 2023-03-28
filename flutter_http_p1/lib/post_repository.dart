
import 'dart:convert';

import 'package:flutter_http_p1/post_dto.dart';
import 'package:http/http.dart' as http;

class PostRepsitory{
  static PostRepsitory? _instance;
  PostRepsitory._();
  static PostRepsitory get instance => _instance ??= PostRepsitory._();

  Future<List<PostDTOTable>?> getDTOList() async{
    String url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      return PostDTOTable.fromJsonList(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}