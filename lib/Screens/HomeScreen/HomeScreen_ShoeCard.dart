import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pairs/Products_Model.dart';
import 'package:pairs/Screen_Config.dart';

class buildShoe_Card extends StatelessWidget {
  late Product given_prod;

  buildShoe_Card({required this.given_prod});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getproportionatescreenwidth(20),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFF6F6F6),
            border: Border.all(
              color: Colors.black,
              width: 3.0,
            )),
        height: getproportionatescreenheight(420),
        width: getproportionatescreenwidth(700),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getproportionatescreenwidth(35)),
          child: Column(
            children: [
              // SizedBox(
              //   width: getproportionatescreenwidth(530),
              //   child: AspectRatio(
              //     aspectRatio: 0.84,
              //     child: Image.network(
              //       image_url,
              //       fit: BoxFit.cover,
              //     ),
              //   ),
              // ),
              Expanded(
                child: Image.network(
                  given_prod.image_url,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              SizedBox(
                height: getproportionatescreenheight(5),
              ),
              Text(
                given_prod.description!,
                style: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Roboto",
                  fontSize: 13,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: getproportionatescreenheight(7),
              ),
              build_Majors(given_prod, context),
              SizedBox(
                height: getproportionatescreenheight(18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Row build_Majors(Product received_prod, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: getproportionatescreenwidth(450),
            height: getproportionatescreenwidth(85),
            child: Text(
              received_prod.product_name,
              style: TextStyle(
                color: Colors.green,
                fontFamily: "JosefinSans-Regular",
                fontSize: 20,
                // fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.visible,
              maxLines: 2,
            ),
          ),
          SizedBox(
            height: getproportionatescreenheight(5),
          ),
          Text(
            received_prod.product_price,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "JosefinSans-Regular",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      GestureDetector(
        onTap: () async {
          final product = {
            "KeyID": received_prod.KeyID,
            "Name": received_prod.product_name,
            "Price": received_prod.product_price,
            "ImageURL": received_prod.image_url
          };

          String User_ID = FirebaseAuth.instance.currentUser!.uid;

          try {
            // Check if the product already exists in CartData collection
            final querySnapshot = await FirebaseFirestore.instance
                .collection('UserData')
                .doc(User_ID)
                .collection('CartData')
                .where('KeyID', isEqualTo: product['KeyID'])
                .limit(1)
                .get();

            if (querySnapshot.size > 0) {
              final snackBar = SnackBar(
                  content: Text(
                'Product already exists in CartData',
              ),);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              // Display error message or show a snackbar/alert dialog
              return;
            }
            await FirebaseFirestore.instance
                .collection('UserData')
                .doc(User_ID)
                .collection('CartData')
                .add(product);
            print("Added Successfully!");
          } catch (e) {
            print("Error $e");
          }
        },
        child: Container(
          transform: Matrix4.translationValues(17, 21, 0),
          height: getproportionatescreenheight(60),
          width: getproportionatescreenwidth(120),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}
