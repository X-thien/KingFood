import 'package:burgerapp/config/color.dart';
import 'package:burgerapp/provider/user_provider.dart';
import 'package:burgerapp/screen/home/drawer_side.dart';
import 'package:burgerapp/screen/order/my_order.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Map<String, dynamic> userData = {};

  Future<void> getdata() async {
    userData = await getUserData();
    setState(() {});
  }

  void initState() {
    super.initState();
    getdata();
  }

  Widget listTitle({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(height: 1),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 18, color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: primaryColor,
              ),
              Container(
                height: 550,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 470,
                          height: 80,
                          padding: EdgeInsets.only(left: 50),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome ${userData['userName']}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: textColor,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("${userData['userEmail']}"),
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: primaryColor,
                                  ),
                                  backgroundColor: scaffoldBackgroundColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyOrder(),
                          ),
                        );
                      },
                      child: listTitle(
                        icon: Icons.shop_outlined,
                        title: "My Orders",
                      ),
                    ),
                    listTitle(
                      icon: Icons.location_on_outlined,
                      title: "My Delivery Address",
                    ),
                    listTitle(
                      icon: Icons.person_outline,
                      title: "Refer A Friends",
                    ),
                    listTitle(
                      icon: Icons.file_copy_outlined,
                      title: "Terms & Conditions",
                    ),
                    listTitle(
                      icon: Icons.policy_outlined,
                      title: "Privacy Policy",
                    ),
                    listTitle(
                      icon: Icons.addchart_outlined,
                      title: "About",
                    ),
                    listTitle(
                      icon: Icons.exit_to_app_outlined,
                      title: "Log Out",
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://nhadepso.com/wp-content/uploads/2023/03/cap-nhat-99-hinh-anh-avatar-gau-cute-de-thuong-ngo-nghinh_1.jpg"),
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
