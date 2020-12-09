import 'package:cloud_firestore/cloud_firestore.dart';

class Client{
  String name ; 
  String email ; 
  List<dynamic> files ; 

  Client({
    this.email,
    this.files,
    this.name
  });

  factory Client.fromDocument(DocumentSnapshot doc){
    return Client(
      name : doc['fullName'],
      email: doc['email'],
      files: doc['files']
    );
  }
}