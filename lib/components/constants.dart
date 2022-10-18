import 'package:flutter/material.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/pages/shopping/shopping_cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

///////////////////////////home arrays////////////////////
final List<Map<String, String>> myArrCategory=[
    {"catId":"1","catImage":"images/category/cat1.png","catName":"مأكولات بحرية"},
    {"catId":"2","catImage":"images/category/cat2.png","catName":"مشاوي"},
    {"catId":"3","catImage":"images/category/cat3.png","catName":"مقبلات"},
    {"catId":"4","catImage":"images/category/cat4.png","catName":"حلويات"},
    {"catId":"5","catImage":"images/category/cat5.png","catName":"وجبات سريعة"},
    {"catId":"6","catImage":"images/category/cat6.png","catName":"عصائر"},
    {"catId":"7","catImage":"images/category/cat7.png","catName":"مخبوزات"},
  ];

  final List<Map<String, String>> myArrProduct=[
    {"proId":"1","proDesc":"proDesc1 proDesc proDesc",
    "proImage":"images/product/pro1.jpg","proName":"product 1"},
    {"proId":"2","proDesc":"proDesc2 proDesc proDesc",
    "proImage":"images/product/pro2.jpg","proName":"product 2"},
    {"proId":"3","proDesc":"proDesc3 proDesc proDesc",
    "proImage":"images/product/pro3.jpg","proName":"product 3"}, 
    ];

//////////////////////////////subcategory/////////////////////////
final List<Map<String, String>> myArrSubCategory=[
    {"subCatId":"1","subCatImage":"images/category/cat1.png","subCatName":"مأكولات بحرية"},
    {"subCatId":"2","subCatImage":"images/category/cat2.png","subCatName":"مشاوي"},
    {"subCatId":"3","subCatImage":"images/category/cat3.png","subCatName":"مقبلات"},
    {"subCatId":"4","subCatImage":"images/category/cat4.png","subCatName":"حلويات"},
    {"subCatId":"5","subCatImage":"images/category/cat5.png","subCatName":"وجبات سريعة"},
    {"subCatId":"6","subCatImage":"images/category/cat6.png","subCatName":"عصائر"},
    {"subCatId":"7","subCatImage":"images/category/cat7.png","subCatName":"مخبوزات"},
  ];
//////////////////////////////////shopping cart array///////////////////////////////
final List<Map<String, String>> myProArr = [
    {"proId":"1","proName":"مشاوي","proPrice":"100",
    "proImage":"images/category/cat1.png","proQty":"3"},
    {"proId":"2","proName":"مشاوي","proPrice":"100",
    "proImage":"images/category/cat2.png","proQty":"3"},
    {"proId":"3","proName":"مشاوي","proPrice":"100",
    "proImage":"images/category/cat3.png","proQty":"3"},
    {"proId":"1","proName":"مشاوي","proPrice":"100",
    "proImage":"images/category/cat1.png","proQty":"3"},
    {"proId":"2","proName":"مشاوي","proPrice":"100",
    "proImage":"images/category/cat2.png","proQty":"3"},
    {"proId":"3","proName":"مشاوي","proPrice":"100",
    "proImage":"images/category/cat3.png","proQty":"3"},
    ];
  ////////////////////////////product array/////////////////////
  final List<Map<String, String>> myArrSubProduct =[
    {"proId":"1","proDesc":"proDesc1 proDesc proDesc",
    "proImage":"images/product/pro1.jpg","proName":"product 1","proOffer":"1"},
    {"proId":"2","proDesc":"proDesc2 proDesc proDesc",
    "proImage":"images/product/pro2.jpg","proName":"product 2","proOffer":"0"},
    {"proId":"3","proDesc":"proDesc3 proDesc proDesc",
    "proImage":"images/product/pro3.jpg","proName":"product 3","proOffer":"0"},
    {"proId":"1","proDesc":"proDesc1 proDesc proDesc",
    "proImage":"images/product/pro1.jpg","proName":"product 1","proOffer":"1"},
    {"proId":"2","proDesc":"proDesc2 proDesc proDesc",
    "proImage":"images/product/pro2.jpg","proName":"product 2","proOffer":"0"},
    {"proId":"3","proDesc":"proDesc3 proDesc proDesc",
    "proImage":"images/product/pro3.jpg","proName":"product 3","proOffer":"0"}, 
    {"proId":"1","proDesc":"proDesc1 proDesc proDesc",
    "proImage":"images/product/pro1.jpg","proName":"product 1","proOffer":"1"},
    {"proId":"2","proDesc":"proDesc2 proDesc proDesc",
    "proImage":"images/product/pro2.jpg","proName":"product 2","proOffer":"0"},
    {"proId":"3","proDesc":"proDesc3 proDesc proDesc",
    "proImage":"images/product/pro3.jpg","proName":"product 3","proOffer":"0"}, 
    ];

////////////////////////////////favorite////////////////////////////
final List<Map<String, String>> myArrFav=[
    {"proId":"1","proDesc":"proDesc1 proDesc proDesc",
    "proImage":"images/product/pro1.jpg","proName":"product 1"},
    {"proId":"2","proDesc":"proDesc2 proDesc proDesc",
    "proImage":"images/product/pro2.jpg","proName":"product 2"},
    {"proId":"3","proDesc":"proDesc3 proDesc proDesc",
    "proImage":"images/product/pro3.jpg","proName":"product 3"}, 
    {"proId":"1","proDesc":"proDesc1 proDesc proDesc",
    "proImage":"images/product/pro1.jpg","proName":"product 1"},
    {"proId":"2","proDesc":"proDesc2 proDesc proDesc",
    "proImage":"images/product/pro2.jpg","proName":"product 2"},
    {"proId":"3","proDesc":"proDesc3 proDesc proDesc",
    "proImage":"images/product/pro3.jpg","proName":"product 3"}, 
    {"proId":"1","proDesc":"proDesc1 proDesc proDesc",
    "proImage":"images/product/pro1.jpg","proName":"product 1"},
    {"proId":"2","proDesc":"proDesc2 proDesc proDesc",
    "proImage":"images/product/pro2.jpg","proName":"product 2"},
    {"proId":"3","proDesc":"proDesc3 proDesc proDesc",
    "proImage":"images/product/pro3.jpg","proName":"product 3"}, 
    ];
///////////////////////////////////variables/////////////////////////////
const Color primaryColor = Color(0xffFF0000);

const TextStyle textstyle = TextStyle(color: Colors.white,fontSize: 15,);
const TextStyle bigTex = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const TextStyle smallTex =TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey);

//////////////////////boxDecoration/////////////////////////

  BoxDecoration boxBorder = BoxDecoration(
    borderRadius: BorderRadius.circular(15), color:Colors.grey[200] );

BoxDecoration boxImg({String img = "" , double rad = 15.0}) =>  BoxDecoration(
  image: DecorationImage(
    image:AssetImage(img),
    fit: BoxFit.cover,),
    borderRadius: BorderRadius.circular(rad)
  );

 BoxDecoration boxShade = BoxDecoration(
        //color: Colors.red,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:<Color>[
            Colors.red , Colors.red.shade300 , Colors.red.shade400 , Colors.red
          ]
        ),
        boxShadow: [BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 1,blurRadius: 1,
            offset: Offset(0, 1),
          )],
        borderRadius: BorderRadius.circular(20.0));
///////////////////////////////////////////////////////////////////////////

//////////////////////////////////navigation///////////////////////////////////////
void navigateTo(context, widget) =>
Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => widget),
      (route) => false, //keep the previous route or not
);

void navigatePop(context) => Navigator.of(context).pop();
//////////////////////////////////////////////////////////////////////////////

///////////////////////////////widgets///////////////////////////////////////////
BottomNavigationBarItem bottomNavItem(IconData icon, String text) =>
BottomNavigationBarItem(icon: Icon(icon),label: text.toString(),);

Widget bottomNav({required List<BottomNavigationBarItem> item}) => BottomNavigationBar(
              currentIndex:0,iconSize: 30,
              selectedFontSize: 18,unselectedFontSize: 14,
              unselectedItemColor: Colors.grey,selectedItemColor:primaryColor,
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: item);
///////////////////////////////////////////////////////////
Widget customContainer(
  {IconData icon = Icons.arrow_back_ios_new,
Color color = Colors.white, EdgeInsetsGeometry? edge,
void Function()? onPressed}) =>Container(
  padding: edge,
    decoration: boxShade,
    child: IconButton(
      icon: Icon(icon,color: color,),
      onPressed: onPressed,
    ),);

/////////////////////////////////method/////////////////////////////
Widget headerBuild(BuildContext context) => Container(
      padding:EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          customContainer(icon: Icons.shopping_cart ,
          onPressed: ()=> navigateTo(context,ShoppingCart())),
          customContainer(onPressed: ()=>navigatePop(context)),
        ],),);
  
 Widget imageProduct(){
   return Container(
     padding: EdgeInsets.only(bottom:15.0),
     decoration: boxShade.copyWith(borderRadius: BorderRadius.only(
       bottomLeft: Radius.circular(40.0),bottomRight: Radius.circular(40.0),),
       color: Colors.white),
     child: Column(
       children: [
         Image.asset("images/product/pro1.jpg"),
         Padding(padding: EdgeInsets.only(top: 30.0)),
         Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customContainer(icon: Icons.exposure_minus_1),
          CustomText(text: "1",color: Colors.black,size: 25.0,padEdge:EdgeInsets.all(15),),
          customContainer(icon: Icons.exposure_plus_1),
        ],),],),
   );
 }
//////////////////////////////////////////////////////////////
///
///


////////////from dashboard
const String token = "tokentokentokentokentoken";

final String pathApi = "http://192.168.1.18/restaurant/api/";
final String pathImages = "http://192.168.1.18/restaurant/images/";

String? customerIdVal = "";
final String customerId = "cus_id";
final String customerName = "cus_name";
final String customerPhone = "cus_phone";
//final String? customerImage = "cus_image";

SharedPreferences? prefs;