import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const UserTile({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Icon(Icons.account_circle, size: 50),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
