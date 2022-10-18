import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_button.dart';
import 'package:restaurant/components/custom_scaffold.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/components/custom_text_form_field.dart';

class ForgotPassword extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backColor: Colors.grey[400],
      widget: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  child: ListView(
                    children: [ 
                      CustomText(text: "نسيت كلمة المرور",size: 25,
                      color: primaryColor,padEdge:EdgeInsets.all(40),),
                      CustomText(
                        text: " قم بادخال البريد الالكتروني حتي تستطيع "
                        "استقبال رمز لتعيين كلمة مرور جديدة",
                        size: 24,color: Colors.white,
                        ),
                      CustomTextFormField(hint: 'البريد الالكتروني',
                      validator:(String? value){
                        if(value?.indexOf(".") ==-1||value?.indexOf("@") ==-1||value!.length <1){
                          return "برجاء ادخال البريد الالكتروني";
                        }
                      }),
                        CustomButton(text: "ارسال",press: (){},size: 25,),
                    ],),),),],
          ),),
    );
  }}