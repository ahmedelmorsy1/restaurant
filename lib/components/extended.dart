import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/components/methods.dart';
import 'package:restaurant/pages/product/product_details.dart';

////////////////////product//////////////////////
class SonProduct extends SingleProduct {
  final String proOffer;
  SonProduct({Key? key, String proId = "", String proName = "",
   String proDesc = "", String proImage = "", this.proOffer = ""})
  : super(key: key,proId: proId,proName: proName,proDesc: proDesc,proImage: proImage);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: boxBorder,
        padding:EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        child: Row(
          children: [
            Container(
              margin:EdgeInsets.all(5),
              height: 100.0,
              width: 100.0,
              decoration: boxImg(img:proImage),
            ),
            Expanded(
              child: Container(
                margin:EdgeInsets.all(5),
                height: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(proName,style: bigTex,),
                    ////////////
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                      children:[
                        TextSpan(text: proDesc),
                      ])),
                      ////////////
                  ],
                ),
              ),
            ),
            //===================favorite==========================
            Container(
              height: 100.0,
              width: 55.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite_border),
                  proOffer =="1"?
                  CustomText(text:"عرض",size: 16,padEdge: EdgeInsets.symmetric(horizontal: 10.0),
                  decor: boxBorder.copyWith(color: Colors.red),):Text(""),
                ],
              ),
            )
            //===================end favorite==========================
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////favorite////////////////////
class SonFavProduct extends SingleProduct {
  
  SonFavProduct({Key? key, String proId = "", String proName = "",
   String proDesc = "", String proImage = "",})
  : super(key: key,proId: proId,proName: proName,proDesc: proDesc,proImage: proImage);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>navigateTo(context, ProductDetails()),
      child: Container(
        decoration: boxBorder.copyWith(color: Colors.white),
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border,color: primaryColor,)),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text("s"),
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.width/3,
              decoration: boxImg(img: proImage,rad: 15.0)
            ),
            Expanded(child: Text(proName,style: bigTex,)),
            Row(
              children: [
                Text(proId,style: bigTex,),
                Expanded(child: Text("")),
                Text(proId,style: bigTex),
                Icon(Icons.star,color: Colors.yellow,)
              ],
            )
          ],),
),);
  }
}

/////////////////////////shopping cart/////////////////////////////
class ExProduct extends SingleProduct { 
  final String proQty , proPrice ;
  ExProduct({this.proQty ="", this.proPrice = "",  Key? key ,
  String proId = "" ,String proName = "" ,String proImage ="" }) :
  super(key: key , proId:proId ,proName:proName , proImage:proImage );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Icon(Icons.cancel,color: primaryColor,),
            ),
            Container(
              margin: EdgeInsets.only(top:40),
              child: ListTile(
                title: CustomText(text: proName,color: Colors.black,size: 20,),
                subtitle: CustomText(text: proPrice,color: Colors.grey,),
                leading: Container(
                  width: 70.0,
                  decoration: boxImg(img:proImage),
                ),
                trailing: Container(
                  width: 110.0,
                  child: Row(
                    children: [
                      customContainer(icon: Icons.exposure_plus_1,edge: EdgeInsets.all(3.0)),
                      Expanded(child: Text(proQty,style: bigTex,
                      textAlign: TextAlign.center,)),
                      customContainer(icon: Icons.exposure_minus_1,edge: EdgeInsets.all(3.0)),
                    ],
                  ),),),),
          ],
        ),
      ),
    );
  }
}
