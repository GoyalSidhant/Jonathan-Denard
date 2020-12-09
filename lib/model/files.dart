import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

class ClientFile{
  FileType type ; 
  String mediaURL ; 
  String name ; 
  Timestamp time ; 
  String id ; 

  ClientFile({
    this.type,
    this.mediaURL,
    this.time,
    this.name,
    this.id
  });

  factory ClientFile.fromDocument(DocumentSnapshot doc){
    return ClientFile(
      name : doc['name'],
      type: doc['Filetype'],
      mediaURL: doc['mediaURL'],
      time: doc['timestamp'],
      id : doc['fileID']
    );
  }
}