import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_button.dart';
import 'package:restaurant/components/custom_scaffold.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/components/custom_text_form_field.dart';

class MyProfile extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(backColor: Colors.grey[400],
      widget:Column(
            children: [
              Expanded(
                child: Form(
                  child: ListView(
                    children: [
                      CustomText(text: "تغيير الاعدادات الشخصية",size: 25,color: primaryColor,
                      padEdge: EdgeInsets.all(10.0),),
                      CustomTextFormField(hint: 'اسم المستخدم',
                      validator:(String? value){
                        if(value!.length <1){
                          return "برجاء ادخال الاسم";
                        }
                      }),
                      CustomTextFormField(hint: 'البريد الالكتروني',
                      validator:(String? value){
                        if(value?.indexOf(".") ==-1||value?.indexOf("@") ==-1||value!.length <1){
                          return "برجاء ادخال البريد الالكتروني";
                        }
                      }),
                      CustomTextFormField(hint: 'كلمة المرور',
                      invisible: true,
                      validator:(String? value){
                        if(value!.length <1){
                          return "برجاء ادخال كلمة المرور";
                        }
                      }),
                      CustomTextFormField(hint: 'رقم الهاتف',
                      keyboard: TextInputType.number,
                      validator:(String? value){
                        if(value!.length <5){
                          return "برجاء ادخال رقم الهاتف";
                        }}),
                        CustomButton(text: "حفظ",press: (){},size: 25,),
                    ],
                  ),
                ),),
                ],),
    );
  }}