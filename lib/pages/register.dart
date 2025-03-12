import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.ontap});
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();

  void register(BuildContext context) async {
    final auth = AuthService();
    if (_passwordcontroller.text == _confirmpasswordcontroller.text) {
      try {
        auth.signUp(_emailcontroller.text, _passwordcontroller.text);
      } catch (e) {
        showAboutDialog(context: context, children: [Text(e.toString())]);
      }
    } else {
      showAboutDialog(
          context: context, children: [Text("Passwords do not match")]);
    }
  }

  final void Function()? ontap;

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
              "Let's create an account for you!",
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
              hintText: "Password",
            ),
            const SizedBox(height: 30),
            MyTextField(
              controller: _confirmpasswordcontroller,
              obscure: true,
              hintText: "confirm password",
            ),

            const SizedBox(height: 30),
            MyButton(
              text: "REGISTER",
              onTap: () {
                register(context);
              },
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: ontap,
                  child: Text(
                    "Login now",
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
