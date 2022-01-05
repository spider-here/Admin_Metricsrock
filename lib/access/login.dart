import 'package:admin_metricsrock/access/resetPassword.dart';
import 'package:admin_metricsrock/utils/customWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../home/dashboard.dart';
import 'access_controllers/loginController.dart';

class login extends StatelessWidget {
  customWidgets _widgets = new customWidgets();
  loginController _controller = Get.put(loginController());
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
                                padding: const EdgeInsets.only(top: 20.0),
                              ),
                              SizedBox(
                                width: 300.0,
                                child: _widgets.loginTextField(
                                    context: context,
                                    labelText: "Password",
                                    obscureText: true,
                                    icon: Icon(
                                      Icons.lock_outlined,
                                      color: Colors.grey,
                                    ),
                                    controller: _passController),),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                              ),
                              SizedBox(
                                width: 300.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      child: Text("Forgot Password?", style: TextStyle(fontSize: 12.0),),
                                      onTap: ()=>Get.to(()=>resetPassword()),
                                    )
                                  ],
                                )),
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                              ),
                              Obx(() =>
                                  Visibility(
                                      visible: !_controller.operation.value,
                                      child:
                                      _widgets.mainButton(
                                        context: context,
                                        label: "LOGIN AS ADMIN",
                                        onPressed: () => adminLogin(),
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

  adminLogin() async {
    _controller.operation.value = true;
    if (_emailController.text == _controller.adminEmail) {
      try {
        await _auth
            .signInWithEmailAndPassword(
            email: _emailController.text, password: _passController.text)
            .then((value) {
          _controller.operation.value = false;
          Get.off(() => dashboard());
        });
      }
      on FirebaseAuthException catch (e) {
        _controller.operation.value = false;
        Get.snackbar("Invalid Credentials", e.message.toString(), backgroundColor: Colors.white);
      }
    }
    else {
      _controller.operation.value = false;
      Get.snackbar("Invalid Credentials", "Email or Password Incorrect.", backgroundColor: Colors.white);
    }
  }
}