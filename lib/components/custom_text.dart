import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double size ;
  final Alignment align;
  final EdgeInsetsGeometry? marEdge,padEdge;
  final Decoration? decor;
  final TextDirection dir;
  
  const CustomText({ Key? key, required this.text ,
   this.color =Colors.black , this.size = 15.0,this.align = Alignment.bottomRight,
    this.marEdge, this.padEdge, this.decor, this.dir = TextDirection.rtl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return 
        Container(
          decoration: decor,
          alignment: align,
          margin: marEdge,
          padding: padEdge,
          child: Text(text,
          textDirection: dir,
          style: textstyle.copyWith(color: color,fontSize: size)
    ),
        );
  }
}