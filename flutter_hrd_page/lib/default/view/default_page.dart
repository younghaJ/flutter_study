import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hrd_page/check/controller/check_controller.dart';
import 'package:flutter_hrd_page/check/view/check_page.dart';
import 'package:flutter_hrd_page/default/widgets/defalut_second_item.dart';
import 'package:flutter_hrd_page/default/widgets/default_first_item.dart';
import 'package:provider/provider.dart';

//화면 페이지 내부의 상태를 관리하기 위해 HookWidget 사용할 수 있는 Hook은 useState, useEffect 등이 있다.
//Hook은 build 함수 안에 적는다.
class DefaultPage extends HookWidget {
  DefaultPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final checkController = context.watch<CheckController>();
    List widgetItems = [
          () => DefaultFirstItem(
            checkController.isChecked
          ),
          () => DefaultSecondItem(),
    ];
    final navIndex = useState(0);
    print("DefaultPage 빌드 됨!" + navIndex.value.toString());

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("나의 정보")),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckPage())
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(Icons.move_to_inbox),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int idx) {
          navIndex.value = idx;
        },
        currentIndex: navIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: "나의 정보"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.cabin,
              ),
              label: "나의 정보"
          ),

        ],),
      body: SafeArea(
        child: widgetItems[navIndex.value](),
      ),
    );
  }
}