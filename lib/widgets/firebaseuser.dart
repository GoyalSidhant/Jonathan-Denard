import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirebase{
  String joindate ;
  String email ;
  String fullName ;

  UserFirebase({
    this.email,
    this.fullName,
    this.joindate
  });

  factory UserFirebase.fromDocument(DocumentSnapshot doc){
    return UserFirebase(
      joindate : doc['JoinDate'],
      email : doc['email'],
      fullName : doc['fullName'] ,
    );
  }
}