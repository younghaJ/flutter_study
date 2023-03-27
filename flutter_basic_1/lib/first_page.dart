import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //통신을 받는다.
    //통신 데이터는 Json String
    //통신에서 받아온 데이터를 파생했다고 가정
    // 파싱 = 데이터를 다른 형식으로 변경하는것
    List<String> strList = ["첫번째", "두번째"];


    // 해당 데이터를 위젯으로 바꿔서 칠드런에 넣고 싶다.
    // 방법1. 직접 리스트를 만든다.
    // List<Widget> widgetList = [
    //   Text("첫번째")
    //   Text("두번째")
    // ];

    // 요소의 타입을 String에서 Widget으로 바꿀 함수
    final change = (String str){
      return Text(str);
    };

    // 방법2. 함수를 각각 요소에 적용한다.
    // List<Widget> widgetList = [
    //   change("첫번째"),
    //   change("두번째")
    // ];

    // 방법3.
    // list 메소드 map은 리스트의 요소를 다른 타입으로 변경할 수 있다.
    // map이 요소 각각을 change함수를 사용해서 Widget으로 변경
    // 리스트로 다시 만들어줌
    List<Widget> widgetList = strList.map(change).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          // children은 위젯 List를 받는다.
          children : widgetList
          ,
        ),
      ),
    );
  }
}
