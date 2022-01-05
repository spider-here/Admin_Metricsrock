
import 'package:admin_metricsrock/data/UserDataModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class dashboardController extends GetxController{
  RxList userData = [].obs;
  var dbRef = FirebaseDatabase.instance.ref("Users");


  changeUserStatus(int index) async {
    if(userData[index].enabled){
      await dbRef.child(userData[index].uid).child("enabled").set(false);
    }
    else{
      await dbRef.child(userData[index].uid).child("enabled").set(true);
    }
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dbRef.onChildAdded.listen((event) {
        userData.add(UserDataModel.fromSnapshot(event.snapshot));
    });
    dbRef.onChildChanged.listen((event) {
      var oldEntry = userData.singleWhere((element) => element.uid == event.snapshot.key);
        userData[userData.indexOf(oldEntry)]= UserDataModel.fromSnapshot(event.snapshot);
    });
  }
}