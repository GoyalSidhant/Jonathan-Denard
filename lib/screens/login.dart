import 'package:Jonathan_Denard/screens/forgotpassword.dart';
import 'package:Jonathan_Denard/screens/home.dart';
import 'package:Jonathan_Denard/screens/loading.dart';
import 'package:Jonathan_Denard/screens/register.dart';
import 'package:Jonathan_Denard/widgets/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:Jonathan_Denard/global.dart' as global;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isloading = false;
  AuthService _auth = AuthService();
  String error = '';
  void _onSignIn() async {
    global.email = email.text;
    setState(() {
      _isloading = true;
    });
    print(email);
    try {
      await _auth
          .signInWithEmailAndPassword(email.text, password.text)
          .then((result) async {
        if (result != null) {

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()));
          //print(widget.Role);
          // try{QuerySnapshot userInfoSnapshot = await DatabaseService().getUserData(email.text,widget.Role);
          // print('USER INF');
          // print(userInfoSnapshot.documents);
          // if(userInfoSnapshot.documents.length==0){
          //   setState(() {
          //     error = 'Error signing in!';
          //     _isloading = false;
          //   });
          // }
          // else{
          //   setState(() {
          //     _isloading = false;
          //   });
          //   Navigator.of(context).pushAndRemoveUntil(
          //       MaterialPageRoute(builder: (context) => BottomBar()),
          //           (Route<dynamic> route) => false);}}
          // catch(e){
          //   setState(() {
          //     error = 'Error signing in!';
          //     _isloading = false;
          //   });
          // }
          //print("USER INFO");
          //print(userInfoSnapshot.documents[0].data);

          // await HelperFunctions.saveUserLoggedInSharedPreference(true);
          // await HelperFunctions.saveUserEmailSharedPreference(email.text);
          // await HelperFunctions.saveUserNameSharedPreference(
          //     userInfoSnapshot.documents[0].data['fullName']
          // );
          //
          // print("Signed In");
          // await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
          //   print("Logged in: $value");
          // });
          // await HelperFunctions.getUserEmailSharedPreference().then((value) {
          //   print("Email: $value");
          // });
          // await HelperFunctions.getUserNameSharedPreference().then((value) {
          //   print("Full Name: $value");
          // });

        } else {
          setState(() {
            error = 'Error signing in!';
            _isloading = false;
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return
      _isloading
          ? Loading():Scaffold(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen(
                                    role: global.role,
                                  )),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordScreen()),
                        );
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ],
                ),
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
                  Text("Log in with email address",
                      style: TextStyle(
                          color: Color(0xffef4f4e),
                          fontSize: 25,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text("Let's get started!",
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
                  SizedBox(height: 5),
                  Center(child: TextFormField(
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
                      child: Text("Your Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ))),
                  SizedBox(height: 5),
                  Center(child: TextFormField(
                    controller: password,
                    decoration: new InputDecoration(
                      labelText: "Password",
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
                      child: InkWell(
                    onTap: () {
                      _onSignIn();
                    },
                    child: Text(
                      "Sign in -> ",
                      style: TextStyle(
                          color: Color(0xffef4f4e),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),

                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
