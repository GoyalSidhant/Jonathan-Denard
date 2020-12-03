import 'package:Jonathan_Denard/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  String email;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: WaveClipperTwo(reverse: true),
                child: Container(
                  height: height / 3,
                  width: width,
                  color: Color(0xff14345e),
                ),
              ),
            )),
            Container(
              width: width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Forgot password",
                        style: TextStyle(
                            color: Color(0xffef4f4e),
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Enter you email to reset the password",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        )),
                    SizedBox(height: height / 4.5),
                    Center(
                        child: Text("Your Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ))),
                    Center(child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      onChanged: (val){
                        setState(() {
                          email=val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        contentPadding: EdgeInsets.all(8),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (val) {
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)
                            ? null
                            : "Please enter a valid email";
                      },
                    )

                    ),

                    SizedBox(height: 5),
                    Center(
                        child: InkWell(
                      onTap: () {
                       resetPassword(email);
                      },
                      child: Text(
                        "Submit ",
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
      ),
    );
  }
}
