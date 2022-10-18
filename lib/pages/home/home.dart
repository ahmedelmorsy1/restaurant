import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/components/methods.dart';
import 'package:restaurant/pages/account/my_drawer.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _keyDrawer = GlobalKey();
  
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_keyDrawer,
      body:Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
            children: [
              CustomText(text: "توصيل الطلب الى",color: Colors.grey,marEdge: EdgeInsets.only(top:30)),
              Row(
                children: [
                  CustomText(text:"موقع الزبون الحالي",size:24,color:Colors.black,
                  marEdge:EdgeInsets.all(10),),
                  IconButton(onPressed: () {},icon: Icon(Icons.arrow_drop_down,color: primaryColor,),)
                ],),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      _keyDrawer.currentState!.openEndDrawer();
                    },
                    child: Icon(Icons.menu , color: primaryColor,size: 50.0,)),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: boxBorder,
                      child: TextField(
                        decoration: InputDecoration(
                        hintText: "بحث",
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                      ),),),),],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 125.0,
                child: ListView.builder(
                  itemCount: myArrCategory.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context , int index){
                  return SingleCategory(
                  catId: myArrCategory[index]["catId"].toString(),
                  catImage:  myArrCategory[index]["catImage"].toString(),
                  catName:  myArrCategory[index]["catName"].toString(),);
                }),
              ),
              Divider(),
               Expanded(
                 child: Container(
                  child: ListView.builder(
                    //physics: ScrollPhysics,
                    itemCount: myArrProduct.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context , int index){
                    return SingleProduct(
                    proId: myArrProduct[index]["proId"].toString(),
                    proDesc: myArrProduct[index]["proDesc"].toString(),
                    proImage:  myArrProduct[index]["proImage"].toString(),
                    proName:  myArrProduct[index]["proName"].toString(),);
                  }),
                           ),
               ),
              ],
              ),
      ),
            bottomNavigationBar: bottomNav(item:[
            bottomNavItem(Icons.notifications, "الاشعارات"),
            bottomNavItem(Icons.restaurant_menu, "العروض"),
            bottomNavItem(Icons.person, "حسابي"),
            ]),
            endDrawer: MyDrawer(),
             );
  }
}