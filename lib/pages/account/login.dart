import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_button.dart';
import 'package:restaurant/components/custom_scaffold.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/components/custom_text_form_field.dart';
import 'package:restaurant/pages/account/forgot_pass.dart';
import 'package:restaurant/pages/account/register.dart';
import 'package:restaurant/pages/home/home.dart';

class Login extends StatelessWidget {
  
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
                      CustomText(text: "تسجيل الدخول",size: 25,color: primaryColor,),
                      CustomTextFormField(hint: 'اسم المستخدم',
                      validator:(String? value){
                        if(value!.length <1){
                          return "برجاء ادخال الاسم";
                        }
                      }),
                     
                      CustomTextFormField(hint: 'كلمة المرور',
                      invisible: true,
                      validator:(String? value){
                        if(value!.length <1){
                          return "برجاء ادخال كلمة المرور";
                        }
                      }),
                     
                        CustomButton(text: "دخول",size: 25,
                        press: ()=> navigateTo(context, Home()),),
                         Container(
                           margin: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: CustomText(text: "نسيت كلمة المرور  ",color: Colors.blue,),
                              onTap: ()=> navigateTo(context, ForgotPassword()),
                              ),
                            ),],),
                ),),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: 'ليس لديك حساب؟',color:Colors.black),
                      GestureDetector(
                        child: CustomText(text: "انشأ حساب ",color: Colors.blue,),
                        onTap: ()=> navigateTo(context, Register()),
                        ),
                    ],),)],
          ),),
    );
  }
}