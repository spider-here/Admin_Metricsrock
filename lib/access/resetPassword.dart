import 'package:admin_metricsrock/access/access_controllers/resetPasswordController.dart';
import 'package:admin_metricsrock/utils/customWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class resetPassword extends StatelessWidget{
  customWidgets _widgets = new customWidgets();
  TextEditingController _emailController = new TextEditingController();
  resetPasswordController _controller = Get.put(resetPasswordController());
  var _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actionsIconTheme: IconThemeData(
            color: Theme.of(context).primaryColor
          ),
          iconTheme: IconThemeData(
              color: Theme.of(context).primaryColor
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme
                .of(context)
                .backgroundColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Card(
                color: Theme
                    .of(context)
                    .backgroundColor,
                elevation: 10.0,
                child: Container(
                  width: 500.0,
                  height: 600.0,
                  child: Stack(children: [
                    Align(
                        alignment: FractionalOffset.topCenter,
                        child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 4,
                          child: Image.asset(
                              "assets/images/metricsrock_logo.png",
                              width: 300.0
                          ),
                        )),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 300.0,
                                child: _widgets.loginTextField(
                                    context: context,
                                    obscureText: false,
                                    labelText: "Email",
                                    icon: Icon(
                                      Icons.person_outlined,
                                      color: Colors.grey,
                                    ),
                                    controller: _emailController),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                              ),
                              Obx(() =>
                                  Visibility(
                                      visible: !_controller.operation.value,
                                      child:
                                      _widgets.mainButton(
                                        context: context,
                                        label: "SEND RESET EMAIL",
                                        onPressed: () => sendResetEmail(context),
                                      )
                                  ),
                              ),
                              Obx(() =>
                                  Visibility(
                                    visible: _controller.operation.value,
                                    child: CircularProgressIndicator(),
                                  ))

                            ],
                          )),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ));
  }

  sendResetEmail(BuildContext context) async {
    _controller.operation.value = true;
    try{
      await _auth.sendPasswordResetEmail(email: _emailController.text).then((value){
          Get.back();
          _controller.operation.value = false;
        Get.snackbar("Email Sent", "Please check your email to reset your password.",
        backgroundColor: Colors.white);
      });
    }
    on FirebaseAuthException catch(e){
      _controller.operation.value = false;
      Get.snackbar("Error", e.message.toString(), backgroundColor: Colors.white);
    }
  }

}