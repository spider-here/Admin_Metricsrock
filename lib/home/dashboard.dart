import 'package:admin_metricsrock/utils/customWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'home_controllers/dashboardController.dart';

class dashboard extends StatelessWidget{
  customWidgets _widgets = new customWidgets();
  dashboardController _controller = Get.put(dashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10.0,
        title: Image.asset("assets/images/metricsrock_logo.png", width: 300.0,),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme
              .of(context)
              .backgroundColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: Container(
            width: MediaQuery.of(context).size.width/1.8,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.only(top: 50.0, bottom: 10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(10.0)
            ),
              child: Obx(()=>ListView.builder(
                physics: BouncingScrollPhysics(),
                  itemCount: _controller.userData.length,
                  itemBuilder: (BuildContext context, int index){
                    return _widgets.userListItem(
                        username: _controller.userData[index].username,
                        email: _controller.userData[index].email,
                    action: ()=>_controller.changeUserStatus(index), enabled: _controller.userData[index].enabled);
                  }),),
            ),
      )
    );
  }

}