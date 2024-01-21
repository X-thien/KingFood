import 'package:burgerapp/auth/login_screen.dart';
import 'package:burgerapp/auth/signin.dart';
import 'package:burgerapp/provider/user_provider.dart';
import 'package:burgerapp/screen/home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  // String UserName;
  // String UserImage;
  // String UserEmail;
  SignUp({
    super.key,
    // required this.UserName,
    // required this.UserImage,
    // required this.UserEmail,
  });

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameControler = TextEditingController();
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  final TextEditingController _confirmPasswordControler =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginScreen())),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
          child: Column(
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              TextFields(
                label: 'Full name',
                icon: const Icon(Icons.person_2_outlined),
                controller: _nameControler,
                // suffixtext: '',
              ),
              const SizedBox(height: 10),
              TextFields(
                label: 'Email',
                icon: const Icon(Icons.email_outlined),
                controller: _emailControler,
                // suffixtext: '@gmail.com',
              ),
              const SizedBox(height: 10),
              TextFields(
                label: 'Password',
                secureText: true,
                icon: const Icon(Icons.lock_outlined),
                controller: _passwordControler,
                // suffixtext: '',
              ),
              const SizedBox(height: 10),
              TextFields(
                label: 'Confirm Password',
                secureText: true,
                icon: const Icon(Icons.lock_outlined),
                controller: _confirmPasswordControler,
                // suffixtext: '',
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      userProvider
                          .addUserData(
                            userName: _nameControler.text,
                            userEmail: _emailControler.text,
                            pass: _passwordControler.text,
                          )
                          .then((value) => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => home_Screen()))
                              });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("SignUp"),
                        SizedBox(width: 5),
                        Icon(Icons.arrow_forward_outlined, size: 24)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Already have account?",
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              child: const Text(
                "SignIn",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFields extends StatelessWidget {
  final Icon icon;
  final String label;
  // final String suffixtext;
  bool secureText;
  TextEditingController controller;

  TextFields({
    super.key,
    required this.icon,
    required this.label,
    required this.controller,
    this.secureText = false,
    // required this.suffixtext
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: secureText,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: label,
        prefixIcon: icon,
        labelStyle: const TextStyle(fontSize: 12),
        // prefixText: "  ",
        // suffixText: suffixtext,
        // suffixStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
