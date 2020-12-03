import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class SupportScreen extends StatefulWidget {
  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Jonathan Denard Pro",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffffc10e),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add_alert_outlined,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {})
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height / 2.8),
                  Text("We are here to help!",
                      style: TextStyle(
                          color: Color(0xffef4f4e),
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                      "Whether you have a question about a missing file,a feature, pricing or anything else, we’ll help you resolve your issues quickly and easily, getting you back to more importan things, like relaxing on your new sofa.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      )),
                  SizedBox(height: 20),
                  Center(
                      child: Text("Email us at",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                  Center(
                      child: Text("jdvnn@jnjve.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ))),
                  Divider(),
                  Center(
                      child: Text("Telephone Number",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold))),
                  Center(
                      child: Text("jdvnn@jnjve.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ))),
                  Divider(),
                  Center(
                      child: Image.asset(
                    'assets/jonathan_denard_app_profile_icon.png',
                    height: 50,
                    color: Colors.grey,
                  )),
                  Center(
                      child: Text("Jonathan Denard",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffef4f4e),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: height / 4.5,
                width: width,
                color: Color(0xffffc10e),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Support infomation",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Dont panic! We are in good hands",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )),
          Positioned(
              top: height / 15,
              right: width / 9,
              child: Image.asset(
                'assets/jonathan_denard_app_nov_picture.png',
                height: 300,
                width: 300,
              )),
        ],
      ),
    );
  }
}
