import 'package:flutter/material.dart';
//create provider step 1
class LoadingControl with ChangeNotifier{
  void addLoading(){
    notifyListeners();
  }
}