import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_http_1/post_dto.dart';
import 'package:flutter_http_1/post_repository.dart';
import 'package:http/http.dart' as http;

class ListPage extends HookWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 더미데이터
    //PostDtoTable postDtoTable = PostDtoTable(userId: 0, id: 0, title: "테스트");

    // 실제 데이터
    // 통신은 실패할 수 있다 = nullable
    final listState = useState<List<PostDTOTable>?>(null);

    //final jsonState = useState<String?>(null);

    // useEffect(작동함수, 관찰할 상태 리스트);
    // 빌드가 완료되면 작동한다.
    // 관찰하는 상태가 변경되면 작동한다
    // 관찰하는 상태가 없으면 반드시 1번 작동한다.
    useEffect((){
      // String url = "https://jsonplaceholder.typicode.com/posts";
      // http.get(Uri.parse(url)).then((response) {
      //   // 정상적으로 받아왔는지 체크
      //   // 200은 정상 응답
      //   if(response.statusCode == 200){
      //     // String을 json 형식으로 파싱
      //     dynamic decodedBody = jsonDecode(response.body);
      //     //json을 Map List로 캐스팅
      //     //List jsonList = decodedBody as List;
      //     // List를 map 함수로 풀어서 요소를 PostDTOTable로 변경
      //     // state에 입력
      //     listState.value = PostDTOTable.fromJsonList(decodedBody);
      //
      //     //     jsonList.map((data){
      //     //   // return PostDtoTable(userId: data["userId"], id: data["id"], title: data["title"]);
      //     //   return PostDTOTable.fromJson(data);
      //     // }).toList();
      //   }
      //
      //   //jsonState.value = response.body;
      // });
      PostRepository.instance.getDTOList().then((value){
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
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.cyan)),
      child: Column(
        children: [
          Text("유저번호 : ${postDtoTable.userId}"),
          Divider(),
          Text("글 번호: ${postDtoTable.id}"),
          Divider(),
          Text("글 제목 : ${postDtoTable.title}"),
          Divider(),
        ],
      ),
    )
    ;
  }
}

