import 'package:Jonathan_Denard/screens/profile.dart';
import 'package:Jonathan_Denard/screens/startup.dart';
import 'package:Jonathan_Denard/screens/support.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 150,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      LineIcons.arrow_left,
                      color: Colors.white,
                      size: 40,
                    ),
                  ))),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
            ),
            title: Text('Stéphanie',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            subtitle: Text("Premium Membership",
                style: TextStyle(
                  color: Colors.white,
                )),
            onTap: () {},
          ),
          SizedBox(height: 10),
          ListTile(
            onTap: (){
              Navigator.pop(context);
            },
            title: Text('Home',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
            leading: Icon(
              Icons.home,
              color: Colors.white,
              size: 30,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            title: Text('Profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
            leading: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
          ),
          ListTile(
            title: Text('My Files',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
            leading: Icon(
              Icons.file_present,
              color: Colors.white,
              size: 30,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SupportScreen()),
              );
            },
            title: Text('Support',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
            leading: Icon(
              Icons.support,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.34,
          ),
          ListTile(
            title: Text('Logout',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)),
            trailing: Icon(
              Icons.exit_to_app_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
