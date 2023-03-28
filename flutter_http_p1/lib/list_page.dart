import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_http_p1/post_dto.dart';
import 'package:flutter_http_p1/post_repository.dart';
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = useState<List<PostDTOTable>?>(null);

    useEffect((){
      // String url = "https://jsonplaceholder.typicode.com/users";
      // http.get(Uri.parse(url)).then((response){
      //   if(response.statusCode == 200){
      //     dynamic decodedBody = jsonDecode(response.body);
      //     // List jsonList = decodedBody as List;
      //     // listState.value = jsonList.map((data){
      //     //   // return PostDTOTable(id: data["id"], name: data["name"], username: data["username"], email: data["email"]);
      //     //   return PostDTOTable.fromJson(data);
      //     // }).toList();
      //     listState.value = PostDTOTable.fromJsonList(decodedBody);
      //   }
      // });

      PostRepsitory.instance.getDTOList().then((value){
        listState.value = value;
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
  PostDTOTable postDtoTable;
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
