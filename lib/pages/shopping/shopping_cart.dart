import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_button.dart';
import 'package:restaurant/components/extended.dart';
import 'package:restaurant/components/methods.dart';

class ShoppingCart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children:[ 
            Container(
              margin: EdgeInsets.only(top: 60),
              child: ListView.builder(
                itemCount: myProArr.length,
                itemBuilder: (context,index){
                  return ExProduct(
                    proId: myProArr[index]["proId"].toString(),
                    proName: myProArr[index]["proName"].toString(),
                    proImage: myProArr[index]["proImage"].toString(),
                    proPrice: myProArr[index]["proPrice"].toString(),
                    proQty: myProArr[index]["proQty"].toString(),
                  );
                },
              ),
            ),
          Positioned(
            top:20,left: 20.0,right: MediaQuery.of(context).size.width*7/8,
            child:customContainer(onPressed: ()=>navigatePop(context)),)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5.0),
        height: 205.0,
        child: Column(
          children: [
            TotalPrice(price: "100.0",title: "اجمالي المبلغ",),
            TotalPrice(price: "10.0",title: "خدمة التوصيل",),
            TotalPrice(price: "110.0",title: "اجمالي المبلغ الكي",),
            CustomButton(text: "اضافة الي السلة",size: 20,),
            CustomButton(text: "تأكيد الطلبية",size: 20,press:()=> showSheetMessage(context) ,)
          ],
        ),
      ),
    );
  }
}