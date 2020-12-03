import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
        backgroundColor: Color(0xff14345e),
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
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height / 4),
                    Center(
                        child: Icon(
                      Icons.person,
                      size: 100,
                      color: Color(0xffef4f4e),
                    )),
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
                        child: Text("Your Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ))),
                    SizedBox(height: 5),
                    SizedBox(height: 5),
                    Center(
                        child: Text("Your Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ))),
                    SizedBox(height: 5),
                    SizedBox(height: 5),
                    Center(
                        child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Edit Profile -> ",
                        style: TextStyle(
                            color: Color(0xffef4f4e),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                ),
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
                color: Color(0xff14345e),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Profile information",
                          style: TextStyle(
                              color: Color(0xffef4f4e),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("A little about you !",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          )),
                      Text("Nevermind . You know about it already !",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
