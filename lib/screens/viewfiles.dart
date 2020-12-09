import 'package:Jonathan_Denard/model/client.dart';
import 'package:Jonathan_Denard/widgets/clienthome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ViewFilesAdmin extends StatefulWidget {
  final String email ; 
  ViewFilesAdmin(this.email);
  @override
  _ViewFilesAdminState createState() => _ViewFilesAdminState();
}

class _ViewFilesAdminState extends State<ViewFilesAdmin> {
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff14345e),
        elevation: 0 ,
      ),

      body: Stack(
        children: [
          Container(
            width: width,
            child: Padding(
              padding: const EdgeInsets.only( left:20.0 , ),
              child: Center(
                child: ClientHome(widget.email)
              ),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: height / 6,
                width: width,
                color: Color(0xff14345e),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Client Files",
                          style: TextStyle(
                              color: Color(0xffef4f4e),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
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