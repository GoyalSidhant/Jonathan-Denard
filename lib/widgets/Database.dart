import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Jonathan_Denard/global.dart'as global;

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
      'files':[],
    });
  }

  Future updateData(String fullName, String email, String password) async {
    return await admin.document(uid).setData(<String,dynamic>{
      'fullName': fullName,
      'email': email,
      'password': password,
      'JoinDate': getCurrentDate(),
    });
  }
  Future updateAdmin(String fullname,String email,String Role)async{
    print(global.uid);
    print(Role);
    print(email);
    print(fullname);
    return await Firestore.instance.collection(Role).document(global.uid).updateData(<String,dynamic>{
      'fullName':fullname,
      'email':email,
    });
  }
  Future updateClientFile(String ID) async{
    return  await client.document(ID).updateData(<String,dynamic>{
      'files': FieldValue.arrayUnion([uid]),
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
