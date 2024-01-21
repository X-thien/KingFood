import 'package:burgerapp/auth/signup.dart';
import 'package:burgerapp/provider/user_provider.dart';
import 'package:burgerapp/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // late UserProvider userProvider;

  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordAddressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // userProvider = Provider.of<UserProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScopeNode currenFocus = FocusScope.of(context);
        if (currenFocus.hasPrimaryFocus && currenFocus.focusedChild != null) {
          currenFocus.focusedChild?.unfocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailAddressController,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  labelStyle: TextStyle(fontSize: 12),
                  // prefixText: "  ",
                  // suffixText: "@gmail.com",
                  // suffixStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _passwordAddressController,
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Pasword",
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot",
                        style: TextStyle(color: Colors.green),
                      )),
                  labelStyle: const TextStyle(fontSize: 12),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailAddressController.text,
                              password: _passwordAddressController.text)
                          .then((value) => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => home_Screen()))
                              });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Login"),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.arrow_forward, size: 24),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don`t have Account?",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) =>  SignUp()));
                },
                child: const Text(
                  "SignUp",
                  style: TextStyle(color: Colors.green),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
