import 'package:Jonathan_Denard/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
          onPressed: () {},
          shape: CircleBorder(
              side: BorderSide(color: Color(0xffef4f4e), width: 4.0)),
          child: Image.asset(
            'assets/jonathan_denard_app_home_icon.png',
            height: 120,
            width: 120,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:
              Color(0xff14345e), //This will change the drawer background to blue.
        ),
        child: CustomDrawer()
      ),
      body: Stack(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
                color: Color(0xff14345e),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
          ),
          Container(
            height: height / 1.25,
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
                  Text("Hi, Stéphanie",
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
                    height: height / 1.85,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
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
