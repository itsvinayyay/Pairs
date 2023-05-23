import 'package:flutter/material.dart';
import 'HomeScreen_ShoeCard.dart';
import 'package:pairs/Products_Model.dart';

class buildProduct_Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Product>>(
      stream: ProductService().getProductsList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product> Details = snapshot.data!;
          return PageView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              ...List.generate(
                Details.length,
                (index) => buildShoe_Card(
                  given_prod: Details[index],
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
