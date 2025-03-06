import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key, this.ontap});

  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final void Function()? ontap;

  void login(BuildContext context) async {
    final authservice = AuthService();
    try {
      await authservice.signIn(_emailcontroller.text, _passwordcontroller.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo

            Icon(
              Icons.message,
              color: Theme.of(context).colorScheme.primary,
              size: 60,
            ),
            const SizedBox(height: 20),
            Text(
              "Welcome back!",
              style: TextStyle(
                  fontSize: 23, color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(height: 40),
            MyTextField(
              hintText: "Email",
              controller: _emailcontroller,
              obscure: false,
            ),
            const SizedBox(height: 30),
            MyTextField(
              controller: _passwordcontroller,
              obscure: true,
              hintText: "password",
            ),
            const SizedBox(height: 30),
            MyButton(
              text: "LOG IN",
              onTap: () => login(context),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: ontap,
                  child: Text(
                    "Register now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
