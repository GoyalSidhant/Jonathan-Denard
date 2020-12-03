import 'package:Jonathan_Denard/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:Jonathan_Denard/global.dart' as global;
class LoginOption extends StatefulWidget {
  @override
  _LoginOptionState createState() => _LoginOptionState();
}

class _LoginOptionState extends State<LoginOption> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xff14345e), Color(0xff14345f)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70.0,
                // maxRadius: 66.0,
                child: Center(
                  child: Image.asset(
                    'assets/staff.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ), */
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {
                  global.role = "Graphic";
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        //builder: (context) => BottomBar()
                        builder: (context) => RegisterScreen(role: "admin",),
                      ));
                },
                color: Colors.transparent,
                textColor: Colors.white,
                child:
                    Text("Graphic Designer".toUpperCase(), style: TextStyle(fontSize: 30)),
              ),
              SizedBox(
                height: 20,
              ),
              /* CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70.0,
                // maxRadius: 66.0,
                child: Center(
                  child: Image.asset(
                    'assets/sec1.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ), */
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {
                  global.role = "Client";
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(role: "Client",),
                        //builder: (context) => BottomBar()
                      ));
                },
                color: Colors.transparent,
                textColor: Colors.white,
                child: Text("Client".toUpperCase(),
                    style: TextStyle(fontSize: 30)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}