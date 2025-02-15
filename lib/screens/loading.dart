import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff14345e), Color(0xff14345e)])),
      child: Center(
          child: SpinKitRing(
            color: Colors.white,
            size: 50.0,
          )
      ),
    );
  }
}