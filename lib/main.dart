import 'package:burgerapp/auth/login_screen.dart';
import 'package:burgerapp/provider/product_provider.dart';
import 'package:burgerapp/provider/review_cart_provider.dart';
import 'package:burgerapp/provider/user_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      options: const FirebaseOptions(
          apiKey: "AIzaSyCEmFHQJnjhsNAAKxSVtxcuL_ox630ygXc",
          // authDomain: "projectthu5tot.firebaseapp.com",
          projectId: "projectthu5tot",
          storageBucket: "projectthu5tot.appspot.com",
          messagingSenderId: "1081117939779",
          appId: "1:1081117939779:web:c81821dd09725e081d1cf6"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
