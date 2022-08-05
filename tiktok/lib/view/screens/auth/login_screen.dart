import 'package:flutter/material.dart';
import 'package:tiktok/control/auth_controller.dart';
import 'package:tiktok/view/widgets/gitch.dart';
import 'package:tiktok/view/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        //const - Constant - Value - String , Int
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(
                child: const Text(
              "Tik Tok",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
            )),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                myLabelText: "Email",
                myIcon: Icons.email,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passwordController,
                myLabelText: "Password",
                myIcon: Icons.lock,
                toHide: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthController.instance
                      .login(_emailController.text, _passwordController.text);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: const Text("Login")))
          ],
        ),
      ),
    );
  }
}
