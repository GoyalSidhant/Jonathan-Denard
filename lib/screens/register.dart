import 'package:Jonathan_Denard/screens/home.dart';
import 'package:Jonathan_Denard/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Jonathan_Denard/widgets/User.dart';
import 'package:Jonathan_Denard/widgets/Database.dart';
import 'package:Jonathan_Denard/screens/loading.dart';
import 'package:Jonathan_Denard/global.dart' as global;
class RegisterScreen extends StatefulWidget {
  final String role;
  RegisterScreen({this.role});
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool checked = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  User _userFromFirebaseUser(FirebaseUser user) {
    return (user != null) ? User(uid: user.uid) : null;
  }
  //final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  // String Token='';
  // Future<void> _register () async{
  //   await _firebaseMessaging.getToken().then((token) {print(token);
  //   setState(() {
  //     Token=token;
  //   });
  //   }
  //   );
  // }
  Future registerWithEmailAndPassword(
      String fullName,
      String email,
      String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      global.email=email;
      global.uid=user.uid;

      // Create a new document for the user with uid
      if(widget.role=='admin'){
        await DatabaseService(uid: user.uid).updateData(
            fullName, email, password);
        return _userFromFirebaseUser(user);}
      else{
        await DatabaseService(uid: user.uid).updateUserData(
            fullName, email, password);
        return _userFromFirebaseUser(user);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  String fullName = '';
  String email = '';
  String password = '';
  String error = '';
  String DOB = '';
  String MobileNumber = '';
  void _onRegister() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      await registerWithEmailAndPassword(fullName, email, password)
          .then((result) async {
        if (result != null) {
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(
          //         builder: (context) => BottomBar(i:1)));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(i:1)),
          );
        } else {
          setState(() {
            error = 'Error while registering the user!';
            _isLoading = false;
          });
        }
      });
    }
  }
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return _isLoading
        ? Loading():Scaffold(
      appBar: AppBar(
        toolbarHeight: 5,
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
                  height: height / 4,
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
                  SizedBox(height: height / 7),
                  Form(
                    key: _formKey,
                    child: Center(
                        child: Text("Your Email",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ))),
                  ),

                  SizedBox(height: 5),
                  Center(child: TextFormField(
                    style: TextStyle(color: Colors.black),
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
                        const BorderSide(color: Colors.white, width: 2.0),
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
                  SizedBox(height: 20.0),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (val){
                      setState(() {
                        fullName=val;
                        global.name = val;
                        //print(global.name);
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "First Name",
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
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
                    style: TextStyle(color: Colors.black),
                    onChanged: (val){
                      setState(() {
                        password=val;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) =>
                    val.length < 6 ? 'Password not strong enough' : null,
                    obscureText: true,
                  )),
                  SizedBox(height: 5),
                  Center(
                      child: Text("Confirm Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                          ))),
                  SizedBox(height: 5),
                  Center(child: TextFormField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (val) {
                      if (val.isEmpty) {
                        return "Please Re-Enter New Password";

                      } else if (val.length < 6) {
                        return "Password must be atleast 8 characters long";
                      } else if (val != password) {
                        return "Password must be same as above";
                      } else {
                        return null;
                      }

                    },
                      obscureText: true,
                    //val.length < 6  ? 'Password not strong enough' : null,

                  )),
                  Center(
                      child: InkWell(
                    onTap: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomeScreen()),
                      //);
                      _onRegister();

                    },
                    child: Text(
                      "Sign in -> ",
                      style: TextStyle(
                          color: Color(0xffef4f4e),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  SizedBox(height: 10),
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
