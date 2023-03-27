
import 'package:flutter/cupertino.dart';

class CounterController with ChangeNotifier {
  int _count = 0; // _는 private

  int get count => _count;

  void changeTo(int newCount){
    _count = newCount;
    notifyListeners();
    // 상태 변경 후 무조건 호출
  }

}