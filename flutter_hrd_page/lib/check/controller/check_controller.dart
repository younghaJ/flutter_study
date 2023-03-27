
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hrd_page/main.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CheckController()),
      ],
      child: MyApp(),
    )
  );
}

class CheckController extends ChangeNotifier{
  bool _isChecked = false;
  bool get isChecked => _isChecked;
  void change(){
    _isChecked = !_isChecked;
    notifyListeners();
  }
}