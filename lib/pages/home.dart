import 'package:chat_app/pages/chatpage.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import 'package:chat_app/widgets/my_drawer.dart';
import 'package:chat_app/widgets/usertile.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  void logout(BuildContext context) {
    final auth = AuthService();
    auth.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Chat App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () => logout(context),
            icon: const Icon(Icons.logout, color: Colors.black),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
              child: Text("Error loading users",
                  style: TextStyle(color: Colors.black)));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Text("No users found.",
                  style: TextStyle(color: Colors.black)));
        }

        return ListView(
          children: snapshot.data!.map<Widget>((userData) {
            return _buildUserListItems(userData, context);
          }).toList(),
        );
      },
    );
  }

  Widget _buildUserListItems(
      Map<String, dynamic> userdata, BuildContext context) {
    if (userdata["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userdata["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                recieverEmail: userdata["email"],
                recieverId: userdata["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
