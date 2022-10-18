import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_button.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/pages/account/login.dart';
import 'package:restaurant/pages/account/register.dart';

class Tips extends StatelessWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myArray=[
      {"title":"ابحث عن المأكولات التي تحبها","info":"افضل الأطعمة","image":"images/tip1.png"},
       {"title":"ابحث عن المأكولات التي تحبها","info":"افضل الأطعمة","image":"images/tip2.png"},
       {"title":"ابحث عن المأكولات التي تحبها","info":"افضل الأطعمة","image":"images/tip3.png"}
    ];
    double myHeight = MediaQuery.of(context).size.height / 6;
    return Scaffold( 
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                child: CustomText(text:"تسجيل الدخول",size: 20,color: primaryColor,),
                onTap: () => navigateTo(context, Login()),
                ),
            ),
            Container(
              height: myHeight * 4,
              child: PageIndicatorContainer(
                shape: IndicatorShape.circle(),
                length:myArray.length,
                align: IndicatorAlign.bottom,
                indicatorColor: Colors.white,   
                indicatorSelectorColor:Colors.red,
                child: PageView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection:Axis.horizontal,
                  itemCount: myArray.length,
                  itemBuilder: (BuildContext context,i){
                    return SingleTips(
                      title: myArray[i]["title"].toString(),
                      info: myArray[i]["info"].toString(),
                      image: myArray[i]["image"].toString());
                } ),),
            ),
            Expanded(
              child: Container( 
                padding: EdgeInsets.all(10), 
                child: ListView(
                  children: [
                    Column(
                      textDirection:TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       CustomButton(press: () => navigateTo(context, Register()),
                       text:"انشاء حساب",size: 20,),
                       SizedBox(height: 20,),
                       CustomButton(press: (){},
                       text:"تسجيل فيسبوك",size: 20,
                       color: Colors.black,conColor: Colors.grey,),
                      ],
                    )
                    
                  ], 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleTips extends StatelessWidget {
  final String title;
  final String info;
  final String image;
  const SingleTips({ Key? key, this.title="", this.info ="", this.image = "" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Expanded(child: Container(
          alignment: Alignment.center,
          child: Image.asset(image , fit: BoxFit.cover,),
        ),),
        Padding(padding: EdgeInsets.all(5.0),
        child: CustomText(text:title,size: 25,color: primaryColor,),),
        Padding(padding: EdgeInsets.only(bottom:80.0),
        child: CustomText(text:info,size: 16,color: Colors.grey,),),
      ]
    );
  }
}
