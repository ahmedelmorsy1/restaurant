import 'package:flutter/material.dart';
import 'package:restaurant/components/constants.dart';
import 'package:restaurant/pages/product/product.dart';

class SubCategory extends StatelessWidget {
  final String catId,catName;
  const SubCategory({ Key? key, this.catId = "", this.catName = "" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),
        color: Colors.black,onPressed: ()=>navigatePop(context),),
        title: Text(catName,style:TextStyle(color: Colors.black,),),
        ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.all(10.0),
        child: ListView.builder(
                  itemCount: myArrSubCategory.length,
                  itemBuilder: (BuildContext context , int index){
                  return SingleSubCategory(
                    subCatId: myArrSubCategory[index]["subCatId"].toString(),
                  subCatImage:  myArrSubCategory[index]["subCatImage"].toString(),
                  subCatName:  myArrSubCategory[index]["subCatName"].toString(),);
                }),
      ),
    );
  }
}

class SingleSubCategory extends StatelessWidget {
  final String subCatId, subCatName , subCatImage;
  const SingleSubCategory({ Key? key, this.subCatId="",
  this.subCatName ="", this.subCatImage ="" }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          InkWell(
            onTap:()=>navigateTo(context, Product()),
            child: ListTile(
                leading:Container(
                  margin: EdgeInsets.only(top:5.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.grey[100],),
                  child: Image.asset(subCatImage),),
                  title:Text(subCatName,style: bigTex,),
                  trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}