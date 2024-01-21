import 'package:burgerapp/auth/signin.dart';
import 'package:burgerapp/auth/signup.dart';
import 'package:burgerapp/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background1.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.darken)),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(5, 120, 5, 20),
            ),
            Image.asset(
              "assets/logo_white.png",
              height: 175,
            ),
            const SizedBox(height: 100),
            Button(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  SignUp())
                    );
              },
              text: "SignUp",
            ),
            const SizedBox(
              height: 50,
            ),
            Button(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              text: "SignIn",
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, right: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => home_Screen()));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text;
  final void Function() onPressed;
  Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
