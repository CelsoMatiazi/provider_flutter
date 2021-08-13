
import 'package:flutter/widgets.dart';

class SetDataProvider extends ChangeNotifier{

  int number = 1;
  bool isLoading = false;

  void incrementNumber(){

    isLoading = true;
    notifyListeners();

    number *=  2;

    Future.delayed(Duration(seconds: 1), (){
      isLoading = false;
      notifyListeners();
    });
  }

}