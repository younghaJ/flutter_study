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
    final listState = useState<List<MovieDTOTable>?>(null);

    useEffect((){
      PostRepository.instance.getDTOList().then((value){
        listState.value = value;
      });
    },[]);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: listState.value?.map((e) => ListItem(movieDtoTable: e)).toList() ?? [],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  MovieDTOTable movieDtoTable;
  ListItem({Key? key, required this.movieDtoTable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.red)),
      child: Column(
        children: [
          Text("랭킹 : ${movieDtoTable.rank}"),
          Divider(),
          Text("영화이릅 : ${movieDtoTable.movieNm}"),
          Divider(),
          Text("관객 수 : ${movieDtoTable.audiCnt}"),
          Divider(),
          Text("개봉일: ${movieDtoTable.openDt}"),
          Divider(),
        ],
      ),
    );
  }
}
