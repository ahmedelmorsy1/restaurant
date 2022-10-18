import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_scaffold.dart';
import 'package:restaurant/components/extended.dart';

class Favorite extends StatelessWidget {
  const Favorite({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      dir: TextDirection.ltr,
      backColor: Colors.white,
      title: "وجباتك المفضلة",
      widget:Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: myArrFav.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,childAspectRatio: 0.8),
           itemBuilder: (BuildContext context , int index){
             return SonFavProduct(
              proDesc: myArrSubProduct[index]["proDesc"].toString(),
              proId: myArrSubProduct[index]["proId"].toString(),
              proName: myArrSubProduct[index]["proName"].toString(),
              proImage: myArrSubProduct[index]["proImage"].toString(),
             );
           }),
      )
    );
  }
}

