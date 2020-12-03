import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class AddFile extends StatefulWidget {
  @override
  _AddFileState createState() => _AddFileState();
}

class _AddFileState extends State<AddFile> {
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
                        child: Text("File Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ))),
                    SizedBox(height: 5),
                    SizedBox(height: 5),
                    Center(
                        child: Text("File Type",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ))),
                    SizedBox(height: 5),
                    SizedBox(height: 5),
                    Center(
                        child: Text("Client Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ))),
                    SizedBox(height: 5),
                    SizedBox(height: 5),
                    Center(
                        child: RaisedButton(
                            onPressed: () {},
                            child: Text("Choose File",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                )))),
                    Center(
                        child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Upload ",
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
                      Text("Add File",
                          style: TextStyle(
                              color: Color(0xffef4f4e),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Upload the File",
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
