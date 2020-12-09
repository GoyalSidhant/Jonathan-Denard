import 'dart:developer';
import 'package:Jonathan_Denard/model/files.dart';
import 'package:Jonathan_Denard/model/client.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Jonathan_Denard/global.dart' as global;
import 'package:url_launcher/url_launcher.dart';

class ClientHome extends StatefulWidget {
  final String email;
  ClientHome(this.email);
  @override
  _ClientHomeState createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  final CollectionReference files = Firestore.instance.collection('files');

  List<Client> clientfinal = [];
  List<dynamic> filedocs = [];
  List<ClientFile> fina = [];
  getfiles() async {
    QuerySnapshot client = await Firestore.instance
        .collection('client')
        .where('email', isEqualTo: widget.email)
        .getDocuments();

    //log(client.toString());

    setState(() {
      clientfinal =
          client.documents.map((doc) => Client.fromDocument(doc)).toList();
    });
    log(clientfinal[0].name.toString());

    for (int i = 0; i < clientfinal[0].files.length; i++) {
      files
          .where(FieldPath.documentId, isEqualTo: clientfinal[0].files[i])
          .getDocuments()
          .then((event) {
        if (event.documents.isNotEmpty) {
          Map<String, dynamic> documentData = event.documents.single.data;
          filedocs.add(documentData);

          log(documentData.toString()); //if it is a single document
        }
      }).catchError((e) => print("error fetching data: $e"));
      // filedocs.add(file);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getfiles();
  }

  launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
        height: height / 2,
        child: filedocs.length > 0
            ? ListView.builder(
                itemCount: filedocs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.folder),
                    title: Text(filedocs[index]['name']),
                    trailing: IconButton(
                      icon: Icon(Icons.download_outlined),
                      onPressed: () {
                        launchURL(filedocs[index]['mediaURL']);
                      },
                    ),
                  );
                })
            : Container());
  }
}
