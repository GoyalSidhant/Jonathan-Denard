import 'package:Jonathan_Denard/screens/addfile.dart';
import 'package:Jonathan_Denard/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:Jonathan_Denard/global.dart' as global;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Jonathan_Denard/widgets/firebaseuser.dart';
class HomeScreen extends StatefulWidget {
  int i;
  HomeScreen({this.i=0});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference admin =
  Firestore.instance.collection('admin');
  final CollectionReference client =
  Firestore.instance.collection('client');
  UserFirebase curruser;
  List<UserFirebase> users = [];
  List<UserFirebase> staffs = [];
  List<String>docum=[];
  void  getadmindetials() async {
    QuerySnapshot staff = await admin.getDocuments();
    QuerySnapshot cli = await  client.getDocuments();
    print("admin Details");
    print(staff.documents[0].data.toString());
    setState(() {
      staffs =
          staff.documents.map((doc) => UserFirebase.fromDocument(doc)).toList();
    });
    cli.documents.forEach((result) {
      setState(() {
        print(result.data['fullName']);
        String s=result.data['fullName'].toString()+'_'+result.documentID;
        docum.add(s);
      });
    });
    global.doc=docum;
    print(global.doc);
    List<UserFirebase> data =
    staffs.where((row) => (row.email.contains(global.email))).toList();
    curruser = data[0];
    if(widget.i==0){
      global.name = curruser.fullName;
      QuerySnapshot q=await admin.where('email', isEqualTo: global.email).getDocuments();
      global.uid=q.documents[0].documentID;}

  }

  void getclient() async {
    QuerySnapshot sec = await client.getDocuments();
    print(sec.documents[0].data.toString());
    setState(() {
      users =
          sec.documents.map((doc) => UserFirebase.fromDocument(doc)).toList();
    });
    QuerySnapshot staff = await admin.getDocuments();
    print(staff.documents[0].data.toString());
    setState(() {
      staffs =
          staff.documents.map((doc) => UserFirebase.fromDocument(doc)).toList();
    });
    // staff.documents.forEach((result) {
    //   setState(() {
    //     print(result.data['fullName']);
    //     String s=result.data['fullName'].toString()+'_'+result.documentID;
    //     print(s);
    //     docum.add(s);
    //   });
    // });
    // global.doc=docum;
   // global.staff = staffs;
    List<UserFirebase> data =
    users.where((row) => (row.email.contains(global.email))).toList();
    curruser = data[0];
    if(widget.i==0){
      global.name = curruser.fullName;
      QuerySnapshot q=await client.where('email', isEqualTo: global.email).getDocuments();
      global.uid=q.documents[0].documentID;}
      print('NAME');
      print(global.name);


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(global.role);
    global.role=='admin'?getadmindetials():getclient();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Jonathan Denard Pro",
          style:
              TextStyle(color: Color(0xff14345e), fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Color(0xff14345e), size: 30),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add_alert_outlined,
                color: Color(0xff14345e),
                size: 30,
              ),
              onPressed: () {})
        ],
      ),
      floatingActionButton: Container(
        height: 100.0,
        width: 100.0,
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            global.role != "Client"
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddFile()),
                  )
                : null;
          },
          shape: CircleBorder(
              side: BorderSide(color: Color(0xffef4f4e), width: 4.0)),
          child: global.role == "Client"
              ? Image.asset(
                  'assets/jonathan_denard_app_home_icon.png',
                  height: 120,
                  width: 120,
                )
              : Icon(
                    Icons.add,
                    size: 50,
                    color: Color(0xffef4f4e),
                  ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(
                0xff14345e), //This will change the drawer background to blue.
          ),
          child: CustomDrawer()),
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Color(0xff14345e),
            ),
          ),
          Container(
            height: height / 1.25,
            width: width,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hi"+","+global.name,
                      style: TextStyle(
                          color: Color(0xffef4f4e),
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("What would you like today?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      )),
                  SizedBox(height: 15),
                  TextFormField(
                    decoration: new InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusColor: Colors.black,
                      prefixIcon: Icon(Icons.search),
                      labelStyle: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(),
                  SizedBox(height: 15),
                  Container(
                    height: height / 2,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: Icon(Icons.folder),
                          title: Text("client 1"),
                          trailing: Icon(Icons.more_vert),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.folder),
                          title: Text("client 1"),
                          trailing: Icon(Icons.more_vert),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.folder),
                          title: Text("client 1"),
                          trailing: Icon(Icons.more_vert),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.folder),
                          title: Text("client 1"),
                          trailing: Icon(Icons.more_vert),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.folder),
                          title: Text("client 1"),
                          trailing: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
