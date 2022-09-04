import 'package:e_commerce/logic/controller/main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class mainScreenbning extends Bindings {


  @override
  void dependencies() async {
     WidgetsFlutterBinding.ensureInitialized();

  await Get.put(mainScrenController());


  }


}