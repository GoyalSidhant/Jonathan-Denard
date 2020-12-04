import 'package:Jonathan_Denard/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:Jonathan_Denard/global.dart'as global;
import 'package:Jonathan_Denard/widgets/Database.dart';
import 'package:Jonathan_Denard/widgets/auth.dart';
class editScreen extends StatefulWidget {
  @override
  _editScreenState createState() => _editScreenState();
}

class _editScreenState extends State<editScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
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
      body: SingleChildScrollView(
        child: Stack(
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
                          child: Text(global.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ))),
                      SizedBox(height: 5),
                      SizedBox(height: 5),
                      Center(
                          child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: new InputDecoration(
                              labelText: "Email-ID",
                              contentPadding: EdgeInsets.all(8),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusColor: Colors.black,
                              labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w500),
                            ),

                          )),
                      SizedBox(height: 5),
                      Center(
                        child: TextFormField(
                          controller: name,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (val){
                            print(val);
                          },
                          decoration: new InputDecoration(
                            labelText: "fullname",
                            contentPadding: EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            focusColor: Colors.black,
                            labelStyle: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500),
                          ),

                        )
                      ),
                      SizedBox(height: 5),
                      Center(
                          child: InkWell(
                            onTap: () async{

                               try{await DatabaseService().updateAdmin(name.text,email.text,global.role);
                               if(await AuthService().resetEmail(email.text)=='Success'){
                                 print('Done');
                               }
                               global.email=email.text;
                               global.name=name.text;
                               Navigator.pushReplacement(
                                   context,
                                   MaterialPageRoute(
                                     builder: (context) => HomeScreen(),
                                     //builder: (context) => BottomBar()
                                   ));}
                              catch(e){
                                print(e);
                              }


                            },
                            child: Text(
                              "Submit",
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
      ),
    );
  }
}
