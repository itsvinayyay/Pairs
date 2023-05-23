import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  late String KeyID;
  late String image_url;
  late String? description;
  late String product_name;
  late String product_price;
  late VoidCallback? ontap;

  Product({required this.image_url,
    this.description,
    required this.product_name,
    this.ontap,
    required this.product_price,
    required this.KeyID});
}

// class ProductService {
//   final _firestore = FirebaseFirestore.instance.collection("Products");
//
//   Future<List<Product>> getProductsList() async {
//     List<Product> products = [];
//
//     await for (var documents in _firestore.snapshots()) {
//       for (var fields in documents.docs) {
//         final productname = fields.get('Name');
//         final imageurl = fields.get('ImageURL');
//         final desc = fields.get('Description');
//         final price = fields.get('Price');
//         products.add(Product(
//             image_url: imageurl,
//             description: desc,
//             product_name: productname,
//             product_price: price));
//       }
//     }
//     print(products);
//
//     return products;
//   }
// }
//TODO This is original
class ProductService {
  final _firebase = FirebaseFirestore.instance;


  Stream<List<Product>> getProductsList() {
    final _firestore = _firebase.collection("Products");
    return _firestore.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product(
            image_url: doc['ImageURL'],
            description: doc['Description'],
            product_name: doc['Name'],
            product_price: doc['Price'],
            KeyID: doc['KeyID']);
      }).toList();
    });
  }

  Stream<List<Product>> getCartLists(String userId) {
    final _firestore = FirebaseFirestore.instance.collection("UserData");
    return _firestore.doc(userId).collection('CartData').snapshots().map(
          (snapshot) {
        List<Product> cartList = [];
        for (DocumentSnapshot doc in snapshot.docs) {
          Product product = Product(
            image_url: doc.get('ImageURL'),
            product_name: doc.get('Name'),
            product_price: doc.get('Price'),
            KeyID: doc.get('KeyID'),
          );
          cartList.add(product);
        }
        return cartList;
      },
    );
  }
}




  //TODO to fetch every document in UserData.

//   Stream<List<Product>> getCart_Lists() {
//     final _firestore2 = _firebase.collection("UserData");
//     return _firestore2.snapshots().asyncMap((snapshot) async {
//       List<Product> Cart_List = [];
//       for (DocumentSnapshot doc in snapshot.docs) {
//         CollectionReference nestedCollection_ref = doc.reference.collection(
//             'CartData');
//
//         QuerySnapshot Nestedcollection_SnapShot = await nestedCollection_ref
//             .get();
//
//         for (DocumentSnapshot Nested_doc in Nestedcollection_SnapShot.docs) {
//           Product Nested_Product = Product(
//               image_url: Nested_doc.get('ImageURL'),
//               product_name: Nested_doc.get('Name'),
//               product_price: Nested_doc.get('Price'),
//               KeyID: Nested_doc.get('KeyID'));
//
//           Cart_List.add(Nested_Product);
//         }
//
//       }
//       return Cart_List;
//     });
//   }
// }


// class ProductService {
//   final _firestore = FirebaseFirestore.instance.collection('Products');
//
//   Stream<List<Product>> getProductsStream() {
//     return Stream.fromFuture(getProducts());
//   }
//
//   Future<List<Product>> getProducts() async {
//     List<Product> toBeReturned = [];
//
//     await for (var snapshot in _firestore.snapshots()) {
//       for (var dataset in snapshot.docs) {
//         String desc = dataset.get('Description');
//         String imageURL = dataset.get('ImageURL');
//         String fName = dataset.get('Name');
//         String price = dataset.get('Price');
//
//         final listItem = Product(
//           image_url: imageURL,
//           description: desc,
//           product_name: fName,
//           product_price: price,
//         );
//         toBeReturned.add(listItem);
//       }
//     }
//     print(toBeReturned[0].image_url);
//
//     return toBeReturned;
//   }
// }
//Temporary List for Cart Screen
List<Product> Cart_Products = [
  Product(
      image_url:
      "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1350,h_1350/global/307305/02/sv01/fnd/IND/fmt/png/BMW-M-Motorsport-A3ROCAT-Unisex-Sneakers",
      description:
      "When running becomes part of your routine, you need a shoe that'll help keep you comfortable for the long haul.",
      product_name: "Nike Renew Run 4",
      product_price: "₹7,495",
      KeyID: "201"),
  Product(
      image_url:
      "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1350,h_1350/global/307305/02/sv01/fnd/IND/fmt/png/BMW-M-Motorsport-A3ROCAT-Unisex-Sneakers",
      description:
      "When running becomes part of your routine, you need a shoe that'll help keep you comfortable for the long haul.",
      product_name: "Nike Renew Run 4",
      product_price: "₹7,495",
      KeyID: "201"),
  Product(
      image_url:
      "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_1350,h_1350/global/307305/02/sv01/fnd/IND/fmt/png/BMW-M-Motorsport-A3ROCAT-Unisex-Sneakers",
      description:
      "When running becomes part of your routine, you need a shoe that'll help keep you comfortable for the long haul.",
      product_name: "Nike Renew Run 4",
      product_price: "₹7,495",
      KeyID: "201"),
];
