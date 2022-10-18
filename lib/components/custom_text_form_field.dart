import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text ,  hint;
  final Function(String?)? onSave ;
  final String? Function(String?)?validator;
  final bool invisible;
  final TextEditingController? txtCon;
  final TextInputType? keyboard;

  const CustomTextFormField({Key? key, this.text ="", this.hint ="",
   this.onSave, this.validator, this.invisible=false,
   this.keyboard = TextInputType.text, this.txtCon }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding:EdgeInsets.symmetric(horizontal: 20.0,),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextFormField(
        onSaved: onSave,
        keyboardType: keyboard,
        validator: validator,
        controller: txtCon,
        obscureText: invisible,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}