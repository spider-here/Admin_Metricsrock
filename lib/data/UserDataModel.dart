import 'package:firebase_database/firebase_database.dart';

class UserDataModel{

  String username;
  String uid;
  String email;
  bool enabled;


  UserDataModel(this.username, this.uid, this.email, this.enabled);

  UserDataModel.fromSnapshot(DataSnapshot snapshot):
      uid = snapshot.key.toString(),
  username = (snapshot.value as dynamic)["username"].toString(),
  email = (snapshot.value as dynamic)["email"].toString(),
  enabled = (snapshot.value as dynamic)["enabled"];
}