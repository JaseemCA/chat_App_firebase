import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/pages/settings.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 150, 208, 255),
            ),
            child: Text(
              'Chat app',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Add your onTap code here!
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
              // Navigator.pop(context);
              // Add your onTap code here!
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Logout'),
            onTap: () {
              logout();
              Navigator.pop(context);
              // Add your onTap code here!
            },
          ),
        ],
      ),
    );
  }
}
