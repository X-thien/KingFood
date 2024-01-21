import 'package:burgerapp/auth/login_screen.dart';
import 'package:burgerapp/auth/signin.dart';
import 'package:burgerapp/config/colors.dart';
import 'package:burgerapp/provider/user_provider.dart';
import 'package:burgerapp/screen/home/home_screen.dart';
import 'package:burgerapp/screen/my_profile/my_profile.dart';
import 'package:burgerapp/screen/review_cart/review_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerSide extends StatefulWidget {
  const DrawerSide({super.key});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  // late UserProvider userProvider;
  Map<String, dynamic> userData = {};
  Future<void> getdata() async {
    userData = await getUserData();
    setState(() {});
  }

  void initState() {
    super.initState();
    getdata();
  }

  Widget listTile({
    required IconData icon,
    required String title,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.background2,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundColor: Colors.yellow,
                      backgroundImage: NetworkImage(
                          "data:image/png;base64,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"),
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FutureBuilder(
                        future: FirebaseAuth.instance.authStateChanges().first,
                        builder: (context, AsyncSnapshot<User?> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            // Đang đợi kết quả
                            return CircularProgressIndicator();
                          } else {
                            // Kết quả đã có
                            final User? user = snapshot.data;
                            return Column(
                              children: [
                                Text(
                                    "Welcome ${userData != null ? userData['userName'] ?? 'Guest' : 'Guest'}"),
                                SizedBox(height: 7),
                                Container(
                                  height: 30,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      if (user != null) {
                                        FirebaseAuth.instance.signOut().then(
                                              (value) => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()),
                                              ),
                                            );
                                        print("đã đăng xuất");
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignIn()),
                                        );
                                      }
                                    },
                                    child: Text(
                                      user != null ? "Logout" : "Login",
                                      style:
                                          TextStyle(color: AppColors.textColor),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => home_Screen(),
                  ),
                );
              },
              child: listTile(
                icon: Icons.home_outlined,
                title: "Home",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => reviewCart(),
                  ),
                );
              },
              child: listTile(
                icon: Icons.shop_outlined,
                title: "Review Card",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyProfile(),
                  ),
                );
              },
              child: listTile(
                icon: Icons.person_outline,
                title: "My Profile",
              ),
            ),
            listTile(
              icon: Icons.notifications_outlined,
              title: "Notification",
            ),
            listTile(
              icon: Icons.start_outlined,
              title: "Rating & Review",
            ),
            listTile(
              icon: Icons.favorite_outline,
              title: "Wishlist",
            ),
            listTile(
              icon: Icons.copy_outlined,
              title: "Raise a complaint",
            ),
            listTile(
              icon: Icons.format_quote_outlined,
              title: "FAQs",
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 350,
              child: Column(
                children: [
                  Text("Contact Support"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+1234564878"),
                    ],
                  ),
                  Center(
                    //scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("x12345x@gmail.com"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
