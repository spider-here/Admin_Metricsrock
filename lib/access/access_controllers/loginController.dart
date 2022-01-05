import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class loginController extends GetxController{
  RxBool operation = false.obs;
  var dbRef = FirebaseDatabase.instance.ref("Admin");
  var adminEmail = "";

  getAdminCredentials() async {
    await dbRef.child("email").once().then((v) => adminEmail = v.snapshot.value.toString());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAdminCredentials();
  }
}