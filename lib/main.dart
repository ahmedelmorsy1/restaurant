import 'package:flutter/material.dart';
import 'package:restaurant/pages/home/home.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/pages/tips/get_start.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/constants.dart';
import '../pages/provider/loading.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  customerIdVal = prefs!.getString(customerId);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  build(BuildContext context)  {
    //create provider step 2
    return MultiProvider(providers: [
      ChangeNotifierProvider<LoadingControl>(create: (context)=>LoadingControl(),)
    ],
    child:MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'GE_ar',
        primarySwatch: Colors.blue,
      ),
      home: customerIdVal == null ?GetStart():Home(),
    ),
    );
  }
}