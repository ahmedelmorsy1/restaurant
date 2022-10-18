import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_button.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/components/methods.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Tracking extends StatelessWidget {
  Widget getTimeLine({String text = "" , IconData? icon}) {
    return Container(
      height: 90,
      color: Colors.grey[100],
      child: Stack(
        children: [
          TimelineTile(
            alignment: TimelineAlign.manual,
            lineXY: 0.2,
            indicatorStyle: IndicatorStyle(height: 1.0),
            endChild: Column(
              children:[
                Row(
              children: [
                CustomText(text: text,color: Colors.black,size: 20,align: Alignment.centerLeft,
                 padEdge: EdgeInsets.symmetric(horizontal: 20,vertical: 30),),
                Icon(icon,color: Colors.red,)
              ],
            )
              ]
            )
          )
        ],),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "تتبع الطلبية",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () => navigatePop(context),
            icon: Icon(Icons.arrow_back_ios,color: Colors.black,),),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Row(children: [
                    Text("محادثة",style: TextStyle(color: Colors.red, fontSize: 20.0),),
                    Icon(Icons.chat,color: Colors.red,),
                  ],),)
              ],)
          ],),
        body: ListView(children: [
          CustomText(text: "الوقت المقدر لاستلام الطلبية",color: Colors.black, size: 25,
            align: Alignment.center,padEdge: EdgeInsets.only(top: 10.0),),
          CustomText(text: "5:30:00 ",color: Colors.red,size: 25,
            align: Alignment.center,padEdge: EdgeInsets.all(5.0),),
          Divider(),
          getInfoDelivery(),
          getTimeLine(text: "تاكيد الطلب",icon:Icons.restaurant),
          getTimeLine(text: "تجهيز الطلب",icon:Icons.restaurant),
          getTimeLine(text: "تم تجهيز الطلب في المطعم",icon:Icons.fastfood),
          getTimeLine(text: "الدليفري استلم الطلب",icon:Icons.restaurant),
          getTimeLine(text: "الدليفري قريب من المكان",icon:Icons.restaurant),
        ]),
        bottomNavigationBar: Container(
          height: 50,
          margin: EdgeInsets.all(30),
          child: CustomButton(text: "الغاء الطلبية",conColor: Colors.grey,)),
        );
  }
}
