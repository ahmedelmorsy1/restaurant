import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_text.dart';

class CustomListItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function()? press;
  const CustomListItem(
      {Key? key, this.text = "", this.icon = Icons.home, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          InkWell(
            onTap: press,
            child: ListTile(
              title: CustomText(text: text,size: 17.0,color: Colors.black,),
              leading: Icon(icon , color: primaryColor,),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black, size: 18.0,),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}