import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/components/custom_button.dart';
import 'package:restaurant/components/custom_scaffold.dart';
import 'package:restaurant/components/custom_text.dart';
import 'package:restaurant/components/custom_text_form_field.dart';
import 'package:restaurant/components/progress.dart';
import 'package:restaurant/pages/home/home.dart';
import '../function.dart';
import 'package:restaurant/pages/account/login.dart';
import 'package:restaurant/pages/provider/loading.dart';


class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController txtCustomerName = TextEditingController();
  final TextEditingController txtCustomerPhone = TextEditingController();
  final TextEditingController txtCustomerPass = TextEditingController();
  final TextEditingController txtCustomerEmail = TextEditingController();
  void saveDataCustomer(BuildContext context, LoadingControl load)async {
    bool myValid =  _formKey.currentState!.validate();
    load.addLoading();
     await checkInterConnect();
  if(myValid){
  /*txtCustomerPass.text.isNotEmpty &&txtCustomerName.text.isNotEmpty &&txtCustomerPhone.text.isNotEmpty&&*/ 
      isLoading = true;
      load.addLoading();
    Map arr =  {
    "cus_name": txtCustomerName.text,
    "cus_pwd": txtCustomerPass.text,
    "cus_mobile": txtCustomerPhone.text, 
    "cus_email": txtCustomerEmail.text,
    
  };
      bool res =await save_Data(arr, context,
       "customer/insert_customer.php", Home(),"insert");
      //await createData(arr,context, "AddCustomer/insert_customer.php",Customer()) ;
      isLoading = res;
      load.addLoading();
    }else{
      await checkInterConnect(text:"يرجي اكمال البيانات");
    }
  } 

   @override
  void dispose() {
    super.dispose();
    txtCustomerName.dispose();
    txtCustomerPass.dispose();
    txtCustomerPhone.dispose();
    txtCustomerEmail.dispose();
  }

  
 

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<LoadingControl>(context);
    return CustomScaffold(backColor: Colors.grey[400],
      widget:Column(
            children: [
              Expanded(
                child: Form(
                    key: _formKey,
                  child: ListView(
                    children: [
                      CustomText(text: "انشاء حساب",size: 25,color: primaryColor,),
                      CustomTextFormField(hint: 'اسم المستخدم',
                      txtCon:txtCustomerName,
                      validator:(String? value){
                        if(value!.length <1){
                          return "برجاء ادخال الاسم";
                        }
                      },),
                      CustomTextFormField(hint: 'البريد الالكتروني',
                      txtCon:txtCustomerEmail,
                      keyboard: TextInputType.emailAddress,
                      validator:(String? value){
                        if(value?.indexOf(".") ==-1||value?.indexOf("@") ==-1){
                          return "برجاء ادخال البريد الالكتروني";
                        }
                      }),
                      CustomTextFormField(hint: 'كلمة المرور',
                      txtCon:txtCustomerPass,
                      invisible: true,
                      validator:(String? value){
                        if(value!.length <1){
                          return "برجاء ادخال كلمة المرور";
                        }
                      }),
                      CustomTextFormField(hint: 'رقم الهاتف',
                      txtCon:txtCustomerPhone,
                      keyboard: TextInputType.number,
                      validator:(String? value){
                        if(value!.length <5){
                          return "برجاء ادخال رقم الهاتف";
                        }}),
                        isLoading?circularProgress():CustomButton(text: "تسجيل",press: (){
                          saveDataCustomer(context, myProvider);
                        },size: 25,),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          child: Text( " عند الضغط انت توافق ع شروط التطبيق",
                          style:TextStyle(color: Colors.grey[800]),),
                        )
                    ],
                  ),
                ),),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: 'لديك حساب مسبقا ؟',color:Colors.black),
                      GestureDetector(
                        child: CustomText(text: "سجل الدخول ",color: Colors.blue,),
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Login()))
                        ),],
      ),)],),
    );
  }}