import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pairs/Common_Button.dart';
import 'package:pairs/Products_Model.dart';
import 'package:pairs/Screen_Config.dart';
import 'Cart_Card.dart';

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
        horizontal: getproportionatescreenwidth(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Center(
              child: Text(
                "Your Cart",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: "JosefinSans-Regular",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          StreamBuilder<List<Product>>(
            stream: ProductService().getCartLists(User_ID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> Cart_Items = snapshot.data!;
                if (Cart_Items.length != 0) {
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getproportionatescreenheight(20),
                      ),
                      child: ListView.builder(
                        itemCount: Cart_Items.length,
                        itemBuilder: (context, index) =>
                            BuildCart_Card(Cart_prod: Cart_Items[index]),
                      ),
                    ),
                  );
                }
                else {
                  return Text(
                    "Your Cart is empty!",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  );
                }
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          buildCommon_button(
            onpressed: () {},
            content: "Check Out",
          ),
        ],
      ),
    );
  }
}
