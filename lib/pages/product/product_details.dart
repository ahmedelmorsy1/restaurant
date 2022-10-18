import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_text.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children:[ 
            ListView(
            children: [
              imageProduct(),
              Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "سمك مشوي",size: 30.0,color: Colors.black,),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red,),
                        CustomText(text: "5 ",size: 16.0,color: Colors.grey,),
                        Expanded(child: Text(""),),
                         Icon(Icons.star , color: Colors.orange,),
                        CustomText(text: "5 review",size: 16.0,color: Colors.black,),
                      ],
                    ),
                     CustomText(text: " سمك مشوي سمك مشوي سمك مشوي سمك مشوي سمك مشوي"
                     " ك مشوي سمك مشوي سمك مشوي سمك مشوي سمك مشوي ك مشوي سمك مشوي سمك"
                      "مشوي سمك مشوي سمك مشوي ك مشوي سمك مشوي سمك "
                     "مشوي سمك مشوي سمك مشوي ك مشوي سمك مشوي"
                     " سمك مشوي سمك مشوي سمك مشوي ك مشوي سمك "
                     "مشوي سمك مشوي سمك مشوي سمك مشويك مشوي سمك مشوي سمك مشوي سمك مشوي سمك مشوي",
                     size: 20.0,color: Colors.grey,padEdge:EdgeInsets.all(15),),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top:0.0,right: 0.0,left: 0.0,
            height: 120,
            child: headerBuild(context),),
          ],
        ),),
      bottomNavigationBar: Container(
        height:75,
        padding: EdgeInsets.all(20.0),
        decoration: boxShade.copyWith(borderRadius: BorderRadius.circular(40)),
        child: Row(
          children: [
            Container(
              padding:EdgeInsets.only(left:50.0 , right: 30),
              child: Text("\$1500",style: bigTex.copyWith(fontSize: 30.0,color: Colors.white),)
              ),
              Expanded(child: Text(""),),
              Container(
                decoration: boxShade,
                child: Row(
                  children: [
                    CustomText(text: "اضافة الي السلة",size: 20,padEdge:EdgeInsets.all(3),),
                    Container(
                      child: Icon(Icons.shopping_bag,color: Colors.white,),
                    ),
                  ],),
              )],
        ),),);
  }
}