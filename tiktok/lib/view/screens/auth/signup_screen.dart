import 'package:flutter/material.dart';
import 'package:tiktok/control/auth_controller.dart';
import 'package:tiktok/view/widgets/gitch.dart';

import 'package:tiktok/view/widgets/text_input.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _setpasswordController = new TextEditingController();
  TextEditingController _confirmpasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              GlithEffect(
                child: const Text(" Welcome To Tik Tok",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                 AuthController().pickImage();
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://cdn-icons.flaticon.com/png/512/4433/premium/4433850.png?token=exp=1658594347~hmac=3ee3eaa8da5b119517e7063d7aef5944"),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  myIcon: Icons.email_outlined,
                  controller: _emailController,
                  myLabelText: "Email",
                ),
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  myIcon: Icons.person_outline,
                  controller: _usernameController,
                  myLabelText: "Username",
                ),
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  myIcon: Icons.lock_outlined,
                  controller: _setpasswordController,
                  myLabelText: "New Password",
                  toHide: true,
                ),
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  myIcon: Icons.lock_outlined,
                  controller: _confirmpasswordController,
                  myLabelText: "Confirm Password",
                  toHide: true,
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  AuthController().SignUp(
                      _usernameController.text,
                      _emailController.text,
                      _setpasswordController.text,
                      AuthController().proimg);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: const Text("Sign Up")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
