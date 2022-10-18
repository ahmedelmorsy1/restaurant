import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/pages/tips/tips.dart';

class GetStart extends StatelessWidget {
  const GetStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height / 3;
    return Scaffold( 
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: myHeight *2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image:DecorationImage(image: AssetImage("images/tip0.png"),fit: BoxFit.contain)
                ),
              ),
              Container( 
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,blurRadius: 7,offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                height: myHeight,
                child: ListView(
                  children: [
                    CustomText(text: "اشهي المأكولات",size: 25,),
                    SizedBox(height: 10,),
                    CustomText(text: "كلام مهم كلام مهم كلام مهم كلام مهم كلام مهم كلام مهم "),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        navigateTo(context, Tips());
                      },
                      child: CustomText(text: 'أبدأ من هنا',size: 20,color: Colors.black,),
                    )
                    
                  ], 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
