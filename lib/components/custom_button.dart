import 'package:flutter/material.dart';

import 'constants.dart';

class CustomButton extends StatelessWidget {
  final void Function()? press;
  final String text;
  final double size ;
  final Color color,conColor;
  final EdgeInsetsGeometry? marEdge,padEdge;
  

  const CustomButton({Key? key, this.press, this.text ="",
   this.size =15.0, this.color=Colors.white,
    this.conColor = Colors.red, this.marEdge , this.padEdge, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marEdge,
      padding: padEdge,
      child: MaterialButton(
        onPressed: press,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 3.0),
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: conColor,
          ),
          child: Text(
            text,
            style: textstyle.copyWith(color: color, fontSize: size),
          ),
        ),
      ),
    );
  }
}
