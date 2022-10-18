import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_button.dart';
import 'package:restaurant/components/custom_scaffold.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/components/custom_text_form_field.dart';
import 'package:restaurant/pages/home/home.dart';

class ChangePassword extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      widget: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  child: ListView(
                    children: [
                      CustomText(text: "تغيير كلمة المرور",size: 25,color: primaryColor,
                      padEdge: EdgeInsets.all(10.0),marEdge: EdgeInsets.only(bottom: 10.0),),
                      CustomTextFormField(hint: 'كلمة المرور الحالية ',invisible: true,
                      validator:(String? value){
                      if(value!.length <1){return "برجاء ادخال كلمة المرور";}}),
                      
                      CustomTextFormField(hint: 'كلمة المرور الجديدة ',invisible: true,),
                      CustomTextFormField(hint: 'تأكيد كلمة المرور  ',invisible: true,),
                      CustomButton(text: "حفظ",size: 25,press: ()=> navigateTo(context, Home()),),
                        ],),
                ),),
                ],
),),
    );
  }
}