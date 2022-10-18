import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_button.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/pages/product/product_details.dart';

///////////////////////home ////////////////////////////

class SingleCategory extends StatelessWidget {
  final String catId, catName , catImage;
  const SingleCategory({ Key? key, this.catId="",
  this.catName ="", this.catImage ="" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:5.0),
            padding: EdgeInsets.all(10.0),
            decoration: boxBorder,
            child: Image.asset(catImage),),
            Text(catName,style: bigTex,),
        ],
      ),
    );
  }
}
//////////////////////////////////////////////////////////
class SingleProduct extends StatelessWidget {
  final String proId, proName, proDesc,proImage;
  const SingleProduct({ Key? key, this.proId="",
  this.proName ="", this.proImage="" , this.proDesc ="" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=>navigateTo(context, ProductDetails()),
      child: Container(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("s"),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: boxImg(img: proImage,rad: 15.0)
                    ),
                    Text(proName,style: bigTex,),
                     CustomText(text:proDesc,
                     color: Colors.grey,),
                  ],),
  ),);
}}
//////////////////////shopping cart////////////////////////////////
class TotalPrice extends StatelessWidget {
  final String price , title;
  const TotalPrice({ Key? key, this.price = "", this.title = "" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(children: [
                Text( "\$ "+price,),
                Expanded(child: Text(""),),
                Text( title,),
              ],),
            Divider(),
      ],);
}}

/////////////////shopping cart
void showSheetMessage(context){
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15))
      ),
      context: context, builder: (BuildContext buildContext){
      return Container(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top:30),
                  child: Icon(Icons.done ,color: primaryColor,size: 100,)
                  ),
                  Text( "جاري تنفيذ طلبك ",style: bigTex.copyWith(color: Colors.red),),
                  Text( "يمكنك تتبع طلبك من خلال الضغط على الزر في الاسفل ",style: smallTex),
                  CustomButton(text: "تابع الطلب",size: 20,
                  padEdge: EdgeInsets.symmetric(vertical: 50),),
                  CustomButton(text:"الانتقال الي المأكولات",color: Colors.black,size: 18,
                  conColor: Colors.transparent,marEdge: EdgeInsets.only(top:5),
                  press: (){},)
              ],
            ),

          ],),);
    });
  }

///////////////////////tracking ////////////////////////
Widget getInfoDelivery(){
  return  Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: ListTile(
        title: Text("الاسم",style: smallTex,),
        subtitle: Text("أحمد المرسي",style: bigTex,),
        leading: Image.asset("images/product/pro3.jpg",fit: BoxFit.cover,),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 70.0,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.star,color: Colors.red,),
                  Text("4.0",style: smallTex.copyWith(color: Colors.red),),
                ],
              ),
              Text("144 ",style:TextStyle(color: Colors.grey,),)
            ],
          ),
        ),
      ),
      );
  }