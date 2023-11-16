import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pairs/Screen_Config.dart';
import 'HomeScreen_ProductCarousel.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String User_ID;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User? current_user = FirebaseAuth.instance.currentUser;

    if(current_user!=null){
      User_ID = current_user.uid;

      print(User_ID);
    }
    else{
      User_ID = "error!";
      print("No User Signed In!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getproportionatescreenwidth(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            cursorColor: Colors.black,
            style: TextStyle(
              color: Colors.green,
              fontFamily: "Roboto",
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                size: 35,
                color: Colors.black,
              ),
              suffixIconColor: Colors.green,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
                gapPadding: 0,
              ),
            ),
          ),
          SizedBox(
            height: getproportionatescreenheight(20),
          ),
          Text(
            "Sports never comes in extras!",
            style: TextStyle(
              color: Colors.green,
              fontFamily: "JosefinSans-Regular",
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: getproportionatescreenheight(2),
          ),
          Text(
            "#noextras!",
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: getproportionatescreenheight(15),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Recommended ",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "JosefinSans-Regular",
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: getproportionatescreenheight(15),
          ),
          SizedBox(
            height: getproportionatescreenheight(420),
            child: buildProduct_Carousel(),
          ),
        ],
      ),
    );
  }
}
