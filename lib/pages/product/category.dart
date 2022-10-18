import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/pages/product/sub_category.dart';

class Category extends StatelessWidget {
  const Category({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,onPressed: ()=>navigatePop(context),),
        title: Text("قائمة المأكولات",style:TextStyle(color: Colors.black,),),
        ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
                  itemCount: myArrCategory.length,
                  itemBuilder: (BuildContext context , int index){
                  return SingleCategory(
                  catId: myArrCategory[index]["catId"].toString(),
                  catImage:  myArrCategory[index]["catImage"].toString(),
                  catName:  myArrCategory[index]["catName"].toString(),);
                }),
      ),
    );
  }
}

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
          InkWell(
            onTap:()=>navigateTo(context, SubCategory(catId:catId,catName:catName),),
            child: ListTile(
                leading:Container(
                  margin: EdgeInsets.only(top:5.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.red[100],),
                  child: Image.asset(catImage),),
                  title:Text(catName,style: bigTex,),
                  trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}