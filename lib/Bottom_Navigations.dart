import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pairs/Screen_Config.dart';
import 'package:pairs/Screens/CartScreen/Cart_Screen.dart';
import 'package:pairs/Screens/HomeScreen/Home_Screen.dart';
import 'package:pairs/Screens/SignInScreen/SignIn_Screen.dart';

class Bottom_Navigations extends StatefulWidget {
  static const String id = "Bottom_Navigations";

  @override
  State<Bottom_Navigations> createState() => _Bottom_NavigationsState();
}

class _Bottom_NavigationsState extends State<Bottom_Navigations> {
  final _auth = FirebaseAuth.instance;
  int index = 0;
  List<Widget> Pages = [
    Home_Screen(),
    Cart_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.view_headline_sharp,
                color: Colors.green,
                size: 35,
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    "assets/images/logo.png",
                    scale: 1,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text("Home", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text("About", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                ),
              ],
            ),
            ListTile(
              onTap: () async{
                await _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(context, SignInScreen.id, (route) => false);
              },
              leading: Icon(
                Icons.logout,
                size: 30,
                color: Colors.white,
              ),
              title: Text("Log Out", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
            ),
            // SizedBox(height: getproportionatescreenheight(20),),
          ],
        ),
      ),
      body: Pages[index],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: getproportionatescreenheight(10),
        ),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.center,
          color: Colors.grey,
          activeColor: Colors.green,
          tabBackgroundColor: Colors.white,
          tabBorderRadius: 50,
          textStyle: TextStyle(
            fontFamily: "JosefinSans-Regular",
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
          selectedIndex: index,
          onTabChange: (value) {
            setState(() {
              index = value;
              print(value);
            });
          },
          gap: 2,
          iconSize: 30,
          tabs: [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}
