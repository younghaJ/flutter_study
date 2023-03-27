import 'package:flutter/material.dart';
import 'package:flutter_basic_1/first_page.dart';
import 'package:flutter_basic_1/second_page.dart';
import 'package:flutter_basic_1/third_page.dart';

void main(){
  //플러터 프레임워크에 실행 요청
  runApp(MyApp());
  // 원래는 ()안에 키 값을 넣어줘야 하지만 지금은 위젯이 하나라서 안넣어줘도 된다.
}

//위젯은 화면을 구성하는 요소
class MyApp extends StatelessWidget {
  // 같은 타입의 위젯이 여러개 있을 경우
  // context가 구분할 수 있게 해줌
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThirdPage(),
    );
  }
}
