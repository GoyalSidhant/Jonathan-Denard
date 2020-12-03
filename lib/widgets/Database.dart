import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  // Collection reference
  final CollectionReference client =
  Firestore.instance.collection('client');
  final CollectionReference admin =
  Firestore.instance.collection('admin');


  // update userdata
  Future updateUserData(String fullName, String email, String password) async {
    return await client.document(uid).setData({
      'fullName': fullName,
      'email': email,
      'password': password,
      'JoinDate': getCurrentDate(),
    });
  }

  Future updateData(String fullName, String email, String password) async {
    return await admin.document(uid).setData({
      'fullName': fullName,
      'email': email,
      'password': password,
      'JoinDate': getCurrentDate(),
    });
  }
  Future<QuerySnapshot> getUserData(String email,String Role) async {
    QuerySnapshot snapshot = await Firestore.instance.collection(Role).where('email', isEqualTo: email).getDocuments();
    //print(snapshot.documents[0].data);
    return snapshot;
  }
}

String getCurrentDate() {
  var date = new DateTime.now().toString();

  var dateParse = DateTime.parse(date);

  var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

  return formattedDate.toString();
}
