import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_p1/post_dto.dart';
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = useState<List<PostDtoTable>?>(null);

    useEffect((){
      String url = "https://jsonplaceholder.typicode.com/users";
      http.get(Uri.parse(url)).then((response){
        if(response.statusCode == 200){
          dynamic decodedBody = jsonDecode(response.body);
          List jsonList = decodedBody as List;
          listState.value = jsonList.map((data){
            return PostDtoTable(id: data["id"], name: data["name"], username: data["username"], email: data["email"]);
          }).toList();
        }
      });
    },[]);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value?.map((e) => ListItem(postDtoTable: e)).toList() ?? [],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  PostDtoTable postDtoTable;
  ListItem({Key? key, required this.postDtoTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
      child: Column(
        children: [
          Text("아이디 : ${postDtoTable.id}"),
          Divider(),
          Text("유저 이름: ${postDtoTable.username}"),
          Divider(),
          Text("이름 : ${postDtoTable.name}"),
          Divider(),
          Text("이메일 : ${postDtoTable.email}"),
          Divider(),
        ],
      ),
    );
  }
}
