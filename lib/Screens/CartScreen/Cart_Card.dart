import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pairs/Products_Model.dart';
import 'package:pairs/Screen_Config.dart';

class BuildCart_Card extends StatelessWidget {
  late Product Cart_prod;


  BuildCart_Card({required this.Cart_prod});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getproportionatescreenheight(2),
      ),
      child: Dismissible(
        key: Key(Cart_prod.KeyID),
        direction: DismissDirection.endToStart,
        //TODO Need to add this finctionality for every document in UserData!
        onDismissed: (direction) async {
          String User_ID = FirebaseAuth.instance.currentUser!.uid;
          final querySnapshot = await FirebaseFirestore.instance
              .collection('UserData')
              .doc(User_ID)
              .collection('CartData')
              .where('KeyID', isEqualTo: Cart_prod.KeyID)
              .get();

          final documents = querySnapshot.docs;
          print('Documents: ${documents.length}');
          print(Cart_prod.KeyID);
          if (documents.isNotEmpty) {
            final documentId = documents.first.id;
            final documentReference = FirebaseFirestore.instance
                .collection('UserData')
                .doc(User_ID)
                .collection('CartData')
                .doc(documentId);

            await documentReference.delete();
          }
        },

        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.red.shade400,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.restore_from_trash_rounded,
                size: 30,
              ),
            ],
          ),
        ),
        child: Container(
          height: getproportionatescreenheight(100),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color(0xFFF6F6F6),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              SizedBox(
                width: getproportionatescreenwidth(30),
              ),
              Container(
                height: getproportionatescreenheight(70),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network("${Cart_prod.image_url}"),
                ),
              ),
              SizedBox(
                width: getproportionatescreenwidth(20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: getproportionatescreenwidth(500),
                    height: getproportionatescreenheight(45),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "${Cart_prod.product_name}",
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: "JosefinSans-Regular",
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getproportionatescreenheight(10),
                  ),
                  Text(
                    "${Cart_prod.product_price}",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "JosefinSans-Regular",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
