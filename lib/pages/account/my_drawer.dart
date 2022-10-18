import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/components/custom_list_item.dart';
import 'package:restaurant/pages/account/change_password.dart';
import 'package:restaurant/pages/account/my_profile.dart';
import 'package:restaurant/pages/favorite/favorite.dart';
import 'package:restaurant/pages/order/tracking.dart';
import 'package:restaurant/pages/product/category.dart';
import 'package:restaurant/pages/shopping/shopping_cart.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);
    return Container(
      child: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              Container(
                child: UserAccountsDrawerHeader(
                  //margin:EdgeInsets.only(right:10.0),
                  currentAccountPictureSize: Size.square(60.0),
                    accountName: CustomText(text:"Ahmed Elmorsy",color: Colors.black,size: 20.0,),
                    accountEmail: CustomText(text:"am9471790@gmail.com",color: Colors.grey,),
                    currentAccountPicture: GestureDetector(
                      child:CircleAvatar(
                        backgroundColor: primaryColor,
                        child: Icon(Icons.person,color: Colors.white,),
                      )
                    ),
                    decoration:BoxDecoration(color: Colors.grey.shade100)
                    ),
              ),
                  CustomListItem(text: "الصفحة الرئيسية",icon:Icons.home ),
                  CustomListItem(text: "قائمة المأكولات",icon:Icons.restaurant ,
                  press: ()=>navigateTo(context, Category()),),
                  //CustomListItem(text: "حسابي",icon:Icons.person ),
                  Theme(
                    data:theme,
                    child: ExpansionTile(
                    title: Text("حسابي"),
                    children: [
                    CustomListItem(text: "تغيير الاعدادات الشخصية",icon:Icons.settings,
                    press: ()=>navigateTo(context, MyProfile()), ),
                    CustomListItem(text: "تغيير كلمة المرور",icon:Icons.settings,
                     press: ()=>navigateTo(context, ChangePassword()), ),
                    ],),
                  ),
                  Divider(),
                  CustomListItem(text: "مفضلاتي",icon:Icons.favorite,
                   press:() => navigateTo(context, Favorite())),
                  CustomListItem(text: "طلباتي",icon:Icons.history,
                  press: ()=> navigateTo(context, ShoppingCart()),),
                  CustomListItem(text: "تتبع الطلبية",icon:Icons.drive_eta,
                  press: ()=> navigateTo(context, Tracking()),),
                  CustomListItem(text: "عن المطور",icon:Icons.message),
                  CustomListItem(text: "مركز الدعم",icon:Icons.phone),
            ],
          ),
        ),
      ),
    );
  }
}