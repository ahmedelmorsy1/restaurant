import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';

class CustomScaffold extends StatelessWidget {
  final Widget widget;
  final Color? backColor , textColor;
  final Widget? drawer ,endDrawer , bottomNavigationBar;
  final String title;
  final Key? altKey;
  final TextDirection dir;
  const CustomScaffold({ Key? key,required this.widget,this.backColor =Colors.transparent,
   this.drawer, this.endDrawer,this.bottomNavigationBar,this.textColor = Colors.black,
  this.title ="", this.altKey, this.dir=TextDirection.rtl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:altKey,
      appBar: AppBar(
        backgroundColor: backColor,
        elevation: 0.0,
        title: Text(title,style: TextStyle(color: textColor),),
        leading: IconButton(onPressed: ()=> navigatePop(context),
         icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: Directionality(
        textDirection: dir,
        child:widget
      ),
      drawer: drawer,
      endDrawer: endDrawer,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}