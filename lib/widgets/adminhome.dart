import 'package:Jonathan_Denard/model/client.dart';
import 'package:Jonathan_Denard/screens/viewfiles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final CollectionReference client = Firestore.instance.collection('client');
  List<Client> clientfinal = [];

  getclientlist() async {
    QuerySnapshot cli = await client.getDocuments();

    setState(() {
      clientfinal =
          cli.documents.map((doc) => Client.fromDocument(doc)).toList();
    });
    print(clientfinal[0].toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getclientlist();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
        height: height / 2,
        child: clientfinal.length > 0
            ? ListView.builder(
                itemCount: clientfinal.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      print(clientfinal[index].email.toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewFilesAdmin(clientfinal[index].email )),
                      );
                    },
                    leading: Icon(Icons.folder),
                    title: Text(clientfinal[index].name),
                    trailing: Icon(Icons.forward),
                  );
                })
            : Container());
  }
}
