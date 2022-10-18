//this page is from dashboard project


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '/../components/constants.dart';
import '/../components/custom_text.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:path/path.dart';
// import 'package:async/async.dart';


//////////////////////////////////navigation///////////////////////////////////////
void navigateTo(context, widget) =>Navigator.push(context, MaterialPageRoute(
  builder: (context) => widget));

void navigateFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => widget),
      (route) => false, //keep the previous route or not
);

void navigatePop(context) => Navigator.of(context).pop();
//////////////////////////////////////////////////////////////////////////////




///////////////////////home ////////////////////////////

class SingleCategory extends StatelessWidget {
  final String catId, catName , catImage;
  const SingleCategory({ Key? key, this.catId="",
  this.catName ="", this.catImage ="" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:5.0),
            padding: EdgeInsets.all(10.0),
            decoration: boxBorder,
            child: Image.asset(catImage),),
            Text(catName,style: bigTex,),
        ],
      ),
    );
  }
}
//////////////////////////////////////////////////////////
class SingleProduct extends StatelessWidget {
  final String proId, proName, proDesc,proImage;
  const SingleProduct({ Key? key, this.proId="",
  this.proName ="", this.proImage="" , this.proDesc ="" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      //onTap: ()=>navigateTo(context, ProductDetails()),
      child: Container(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("s"),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: boxImg(img: proImage,rad: 15.0)
                    ),
                    Text(proName,style: bigTex,),
                     CustomText(text:proDesc,
                     color: Colors.grey,),
                  ],),
  ),);
}}

///////////////////////tracking ////////////////////////
Widget getInfoDelivery(){
  return  Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: ListTile(
        title: Text("الاسم",style: smallTex,),
        subtitle: Text("أحمد المرسي",style: bigTex,),
        leading: Image.asset("images/product/pro3.jpg",fit: BoxFit.cover,),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 70.0,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.star,color: Colors.red,),
                  Text("4.0",style: smallTex.copyWith(color: Colors.red),),
                ],
              ),
              Text("144 ",style:TextStyle(color: Colors.grey,),)
            ],
          ),
        ),
      ),
      );
  }

  /////////////////////////////api//////////////////////////////////
  Future<bool> checkConnection ()async{
  try{
    final result = await InternetAddress.lookup("google.com");
    if(result.isNotEmpty&&result[0].rawAddress.isNotEmpty){
      print("connect");
      return true;
    }else{
      print("not connected");
      return false;
    }
  }on SocketException catch(_){
    print("not connect");
      return false;
  }
  
}
  Future<void> checkInterConnect({String text = "يرجي الاتصال بالانترنت"}) async {
     if(!await checkConnection()){
     Fluttertoast.showToast(
       msg: text,
       toastLength: Toast.LENGTH_SHORT,
       gravity: ToastGravity.BOTTOM,
       timeInSecForIosWeb: 1,
       backgroundColor: Colors.red,
       textColor: Colors.white,
       fontSize: 16.0
        );
      }
  }

  ////////////////////////////////api////////////////////////////
  
  
Future<bool> save_Data(Map arrInsert,BuildContext context,String urlPage ,
Widget widget,String type) async {
  String url = pathApi + "$urlPage?token=" + token;
  http.Response respone = await http.post(Uri.parse(url), body: arrInsert);
  if (respone.statusCode == 200) {
    if(type == "insert"){
       navigateTo(context, widget);
    }else{
      navigatePop(context);
    }
    // Map arr = json.decode(utf8.decode(respone.bodyBytes))["message"];
    navigateTo(context, widget);
    print("success");
    return true;
  } else {
    print("fail");
    return false;
  }
}

Future<bool> uploadFileWithData(dynamic imageFile,Map arrInsert,BuildContext context,String urlPage ,
Widget widget , String type) async {
  if(imageFile ==null){
    await save_Data(arrInsert, context, urlPage, widget, type);
    return false;
  }
   var stream = http.ByteStream(imageFile.openRead());
    stream.cast();
    var length = await imageFile.length();
    String url = pathApi + "$urlPage?token=" + token;
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST",uri);
    var multiFile = http.MultipartFile("file",stream,length , filename: basename(imageFile.path));
    for(var entry in arrInsert.entries){
      request.fields[entry.key] = entry.value;
    }
    
    request.files.add(multiFile);
    var response = await request.send();

    if(response.statusCode ==200){
      print("sent successfully");
      if(type == "update"){
        navigatePop(context);
      }else if(type == "insert"){
        navigateTo(context, widget);
      }
      
      return true;
    }else{
        print("failed sent");
        return false;
    }
}

////////////////////////////



Future<List> getData(int count,String urlPage, String strSearch , String param) async {
  String url = pathApi +
      "$urlPage?${param}txtsearch=$strSearch&start=$count&end=10&token=" +
      token;
  http.Response respone = await http.post(Uri.parse(url));

  if (respone.statusCode == 200) {
    List arr = (json.decode(utf8.decode(respone.bodyBytes))["message"]);
    return arr;
  }
  return [];
}

Future<bool> deleteData(String colId,String valId,String urlPage) async {
  String url = pathApi + "$urlPage?$colId=$valId&token=" + token;
  http.Response respone = await http.post(Uri.parse(url));

  if (respone.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
