import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_scaffold.dart';
import 'package:restaurant/components/extended.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding:EdgeInsets.all(10.0),
      child: CustomScaffold(
        dir: TextDirection.ltr,
          title: "سمك مشوي",
          widget: ListView.builder(
          itemCount: myArrSubProduct.length,
          itemBuilder: (context,index){
            return SonProduct(
              proDesc: myArrSubProduct[index]["proDesc"].toString(),
              proId: myArrSubProduct[index]["proId"].toString(),
              proName: myArrSubProduct[index]["proName"].toString(),
              proImage: myArrSubProduct[index]["proImage"].toString(),
              proOffer: myArrSubProduct[index]["proOffer"].toString(),
              
              );
          }),
      ),
    );
  }
}