import 'package:Jonathan_Denard/screens/home.dart';
import 'package:Jonathan_Denard/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class RegisterScreen extends StatefulWidget {
  final String role;
  RegisterScreen({this.role});
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: WaveClipperTwo(reverse: true),
              child: Container(
                  height: height / 3.5,
                  width: width,
                  color: Color(0xff14345e),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an Account?",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      InkWell(
                        child: Text(
                          " Login!",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                      )
                    ],
                  )),
            ),
          )),
          Container(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Join us now!",
                      style: TextStyle(
                          color: Color(0xffef4f4e),
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("We can't wait to have part of the family.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      )),
                  SizedBox(height: height / 6),
                  Center(
                      child: Text("Your Email",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ))),
                  SizedBox(height: 5),
                  Center(child: TextFormField()),
                  SizedBox(height: 5),
                  Center(
                      child: Text("Your Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ))),
                  SizedBox(height: 5),
                  Center(child: TextFormField()),
                  SizedBox(height: 5),
                  Center(
                      child: Text("Confirm Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ))),
                  SizedBox(height: 5),
                  Center(child: TextFormField()),
                  Center(
                      child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Text(
                      "Sign in -> ",
                      style: TextStyle(
                          color: Color(0xffef4f4e),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
