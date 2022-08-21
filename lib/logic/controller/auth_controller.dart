import 'dart:ffi';

import 'package:get/get.dart';

class AuthController extends GetxController  {
    bool visiblePassword=false;
    bool checkedBox=false;

 changeVisiblty(){
  visiblePassword=!visiblePassword;
  update();
}

changeChecked(){
  checkedBox=!checkedBox;
  update();
}
  
}