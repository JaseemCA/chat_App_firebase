import 'package:chat_app/auth/auth_service.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Chat App"),
        actions: [
          IconButton(
            onPressed: () {
              logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to Chat App"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Chat"),
            )
          ],
        ),
      ),
    );
  }
}
